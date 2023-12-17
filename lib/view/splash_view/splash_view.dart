import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app_project_1/services/responsive_layout/responsive_layout.dart';
import 'package:news_app_project_1/view/widgets/text/text.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_project_1/view_model/controllers/splash_view_controller/splash_view_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  SplashViewController splashViewController = Get.put(SplashViewController());
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    splashViewController.navToHomeView(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/json/news_logo.json",
                  controller: animationController,
                  repeat: true,
                  reverse: false,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover, onLoaded: (composite) {
                animationController.duration = composite.duration;
                animationController.repeat();
              }),
              const SizedBox(height: 100),
              TextWidget(
                title: "News App",
                color: 0xff000000,
                fontSize: !HomeResponsive.isMobile(context) ? 30 : 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
