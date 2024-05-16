import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news_app_task/screen/home_page.dart';
import 'package:news_app_task/screen/latest_news.dart';
import 'package:news_app_task/screen/news_details_page.dart';
import 'package:news_app_task/screen/splash.dart';
import 'package:news_app_task/screen/top_news.dart';

const String splash = '/splash';
const String home = '/home_screen';
const String newsDetails = '/news_details_page';
const String topNews = '/top_news';
const String latestNews = '/latest_news';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: home, page: () => NewsHomePage()),
  GetPage(name: newsDetails, page: () => NewsDetailsPage(
    newsItem: Get.arguments,
  )),
  GetPage(name: topNews, page: ()=> TopNewsPage()),
  GetPage(name: latestNews, page: ()=>LatestNewsPage())
];
