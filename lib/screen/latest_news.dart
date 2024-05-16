import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import '../bcodez/app_color.dart';
import '../bcodez/route.dart';
import '../bcodez/widget.dart';
import '../models/news_details.dart';
import '../models/news_id_model.dart';
import '../resource/api_urls.dart';

class LatestNewsPage extends StatefulWidget {
  const LatestNewsPage({super.key});

  @override
  State<LatestNewsPage> createState() => _LatestNewsPageState();
}

class _LatestNewsPageState extends State<LatestNewsPage> {
  List<dynamic> _newsData = [];
  List<NewsDetailsModel> newsLatestList = [];
  // List to hold the fetched data

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<NewsDetailsModel> newsIDtoDetails(int id) async {
    final response = await http
        .get(Uri.parse(ApiUrls.newsDetails.replaceAll("{id}", "$id")));

    if (response.statusCode == 200) {
      final newsDetailsModel = newsDetailsModelFromJson(response.body);
      return newsDetailsModel;
    } else {
      return NewsDetailsModel();
    }
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(ApiUrls.latestNews));

    if (response.statusCode == 200) {
      final newsIdListModel = newsIdModelFromJson(response.body);
      final List<dynamic> dataList = json.decode(response.body);
      newsIdListModel.forEach((element) async {
        var newsIdDetails = await newsIDtoDetails(element);
        newsLatestList.add(newsIdDetails);
      });

      setState(() {
        _newsData = dataList; // Update the list with fetched data
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  String formatDate(int? timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          timestamp * 1000); // Convert Unix timestamp to milliseconds
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}"; // Format the date as 'day/month/year'
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newsLatestList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  var newsItem = newsLatestList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Get.toNamed(newsDetails, arguments: newsItem);
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.lightPurpleColor),
                        child: Row(
                          children: [
                            Container(
                              height: double.maxFinite,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.purpleColor),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Icon(Iconsax.icon),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: customText(
                                      '${newsLatestList[index].title}',
                                      FontWeight.bold,
                                      18.0,
                                      AppColor.purpleColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Iconsax.user,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        customText(
                                            '${newsLatestList[index].by}',
                                            FontWeight.normal,
                                            15.0,
                                            Colors.black)
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Iconsax.calendar_1,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        customText(
                                            formatDate(
                                                newsLatestList[index].time),
                                            FontWeight.normal,
                                            15.0,
                                            Colors.black)
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
