import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_project_1/services/responsive_layout/responsive_layout.dart';
import 'package:news_app_project_1/view/home_view/home_view.dart';
import 'package:news_app_project_1/view/matchesList/categories.dart';
import 'package:news_app_project_1/view/matchesList/matchesList.dart';
import 'package:news_app_project_1/view/sources_view/sources_view.dart';
import 'package:news_app_project_1/view/top_headline/top_headline.dart';
import 'package:news_app_project_1/view/video_stream/video_stream.dart';

import '../login_view/login_view.dart';
import '../navigation_drawer/navigation_drawer.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  String? name;
  String? email;
  Dashboard({super.key, this.email, this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  List<String> text = ["All News", "Top Headlines", "News Sources","Sports Stream"];

  navToRoute(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TopHeadlines()));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SourcesView()));
        break;
         case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  SportsScreen()));
            // MaterialPageRoute(builder: (context) => const MatchesList()));
        break;
      default:
        Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments

    // Access the values using the keys

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ),
        drawer: MyNavigationDrawer(
          title: widget.name,
          email: widget.email,
        ),
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Center(
                child: Column(
                  children: [
                    Lottie.asset(
                      "assets/json/welcome.json",
                      controller: animationController,
                      onLoaded: (composite) {
                        animationController.duration = composite.duration;
                        animationController.repeat;
                      },
                    ),
                    Text(
                      "News App",
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: text.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navToRoute(context, index);
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 60,
                                      width: 80,
                                      child: Lottie.asset(
                                          "assets/json/news.json",
                                          fit: BoxFit.cover)),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    text[index],
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                            !HomeResponsive.isMobile(context)
                                                ? 25
                                                : 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
