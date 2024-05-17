import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:news_app_task/bcodez/widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bcodez/app_color.dart';

class NewsDetailsPage extends StatefulWidget {
  final dynamic newsItem;
  const NewsDetailsPage({super.key, required this.newsItem});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  String formatDateTime(int timestamp) {
    // Convert Unix timestamp to milliseconds
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // Format the date and time
    String formattedDateTime =
        DateFormat('MMMM d, yyyy h:mm a').format(dateTime);

    return formattedDateTime;
  }

  @override
  void initState() {
    // print(widget.newsItem.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = formatDateTime(widget.newsItem.time);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D e t a i l s',
          style: TextStyle(color: AppColor.whiteColor),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Iconsax.arrow_left_2,
              size: 28,
              color: AppColor.whiteColor,
            ),
            onPressed: () => Get.back()),
        backgroundColor: AppColor.purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                widget.newsItem.title, FontWeight.bold, 24.0, Colors.black),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.037,
                  width: MediaQuery.of(context).size.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.purpleColor),
                  child: Center(
                    child: customText(widget.newsItem.type, FontWeight.bold,
                        18.0, AppColor.whiteColor),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.037,
                  width: MediaQuery.of(context).size.width * 0.17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.purpleColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Iconsax.heart,
                        color: AppColor.whiteColor,
                      ),
                      customText(widget.newsItem.score.toString(),
                          FontWeight.bold, 16.0, AppColor.whiteColor),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.purpleColor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png?20190312180423',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.width * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.purpleColor),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Icon(
                          Iconsax.user,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(widget.newsItem.by, FontWeight.bold, 18.0,
                            Colors.black45),
                        customText(formattedDateTime, FontWeight.normal, 16.0,
                            Colors.black45),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.purpleColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(widget.newsItem.url),
                            mode: LaunchMode.inAppWebView);
                      },
                      icon: const Icon(Iconsax.share),
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
