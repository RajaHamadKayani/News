import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_project_1/services/app_url/app_url.dart';

class NewsSourcesController extends GetxController {
  String apiUrl = AppUrl.newsSourceUrl;
  List<Map<String, dynamic>> list = [];
  Future<List<Map<String, dynamic>>> getSourceData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print(response.statusCode);
      }
      list = List<Map<String, dynamic>>.from(data["sources"] ?? []);
      if (kDebugMode) {
        print(data["sources"][5]["category"]);
      }
    } else {
      Get.snackbar("Fetching data error", response.statusCode.toString());
    }
    return list;
  }
}
