import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../bcodez/app_color.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
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
    );
  }
}
