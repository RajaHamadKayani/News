import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_project_1/utils/app_style/app_styles.dart';
import 'package:news_app_project_1/view/dashboard/dashboard.dart';
import 'package:news_app_project_1/view/top_headlines_details.dart/top_headlines_details.dart';
import 'package:news_app_project_1/view_model/controllers/top_hradimes_controller/top_headline_controller.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  List list = [];
  TopHeadlinesController topHeadlinesController =
      Get.put(TopHeadlinesController());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    list = await topHeadlinesController.getData();
    setState(() {}); // Notify the framework that the state has changed
  }

  String parseDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    // Format the date as desired (in this case, "yyyy-MM-dd")
    String formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        title: Text(
          "News App",
          style: AppStyles.headlineBoldWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Headlines for You",
              style: AppStyles.headlineBold,
            ),
            list.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ))
                : Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // Check for null values before accessing properties
                        final imageUrl = list[index]["url"] ?? "";
                        final description = list[index]['description'] ?? "";
                        final title = list[index]['title'] ?? "";
                        final author = list[index]["author"];
                        final sourceName = list[index]["source"]["name"] ?? "";
                        String timestamp = list[index]["publishedAt"] ?? "";
                        String formattedDate = parseDateTime(timestamp);

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TopHeadlinesDetails(
                                          title: title,
                                          description: description,
                                          author: author,
                                          source: sourceName,
                                          date: formattedDate,
                                          url: imageUrl,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Card(
                                  child: ListTile(
                                    leading: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(imageUrl),
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Source: $sourceName",
                                          style: AppStyles
                                              .smallHeadlineMediumBlack,
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                              description,
                                              style: AppStyles.regularBodyBlack,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    title: Text(
                                      title,
                                      style: AppStyles
                                          .subTitleMediumWieghtSmallSizeBlack,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
