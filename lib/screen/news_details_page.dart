import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../bcodez/app_color.dart';

class NewsDetailsPage extends StatefulWidget {
  final dynamic newsItem;
  const NewsDetailsPage({super.key, required this.newsItem});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {



  @override
  void initState() {
    // print(widget.newsItem.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Text(widget.newsItem.title),
          Text(widget.newsItem.by),
          Text(widget.newsItem.score.toString()),
          Text(widget.newsItem.time.toString()),
          Text(widget.newsItem.type),
          Text(widget.newsItem.url),
        ],

      ),
    );
  }
}
