import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_project_1/services/app_url/app_url.dart';

class HomeViewController extends GetxController {
  List<Map<String, dynamic>> list = [];

  Future<List<Map<String, dynamic>>> getData() async {
    final response = await http.get(Uri.parse(AppUrl.newsUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      list = List<Map<String, dynamic>>.from(data["articles"] ?? []);
      print("length of list ${list.length}");
      print(data["articles"][0]["publishedAt"]);
      print(list);
    } else {
      print(response.statusCode.toString());
    }
    return list;
  }
}
