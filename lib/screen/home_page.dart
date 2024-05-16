import 'package:flutter/material.dart';
import 'package:news_app_task/bcodez/app_color.dart';
import 'package:news_app_task/screen/latest_news.dart';
import 'package:news_app_task/screen/top_news.dart';

import '../bcodez/tab_item.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'N e w s   A p p',
            style: TextStyle(color: AppColor.purpleColor),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.whiteColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColor.lightPurpleColor,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColor.purpleColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'Top News'),
                    TabItem(title: 'Latest News'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [TopNewsPage(), Text('latest')]),
        // body: const TabBarView(children: [TopNewsPage(), LatestNewsPage()]),
      ),
    );
  }
}
