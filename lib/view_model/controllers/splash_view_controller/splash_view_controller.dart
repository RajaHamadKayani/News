import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_project_1/view/login_view/login_view.dart';

class SplashViewController extends GetxController {
  Timer? timer;
  void navToHomeView(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.to(const LoginView());
      timer.cancel();
    });
  }
}
