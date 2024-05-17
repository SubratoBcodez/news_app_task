import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_task/bcodez/app_color.dart';
import 'package:news_app_task/bcodez/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  chooseScreen(context) {
    Get.toNamed(home);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => chooseScreen(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.purpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 250, bottom: 400),
              child: Text(
                'N E W S   A P P',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.normal,
                    color: AppColor.whiteColor),
              ),
            ),
            Text(
              "Developed by",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "BasakCodez",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
