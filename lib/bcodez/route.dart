import 'package:get/get_navigation/src/routes/get_route.dart';
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
  GetPage(name: newsDetails, page: () => NewsDetailsPage()),
  GetPage(name: topNews, page: ()=> TopNewsPage()),
  GetPage(name: latestNews, page: ()=>LatestNewsPage())
];
