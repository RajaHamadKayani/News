import 'package:flutter/material.dart';
import 'package:news_app_project_1/utils/app_style/app_styles.dart';
import 'package:news_app_project_1/view/home_view/home_view.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  String? title;
  dynamic url;
  String? source;
  String? date;
  String? description;
  String? author;
  DetailsPage(
      {super.key,
      this.date,
      this.description,
      this.source,
      this.title,
      this.url,
      this.author});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeView()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        title: Text(
          "News Details",
          style: AppStyles.headlineBoldWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                widget.url,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? "",
                    style: AppStyles.regularBodyBlack,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Details:",
                    style: AppStyles.headlineBold,
                  ),
                  Text(widget.description ?? ""),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Pubished At:",
                    style: AppStyles.headlineBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.date ?? ""),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Author:",
                    style: AppStyles.headlineBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.author ?? "")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
