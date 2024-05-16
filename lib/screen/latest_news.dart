import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List<NewsDetailsModel> newsList = [];
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
        newsList.add(newsIdDetails);
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

      body: newsList.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
          return ListTile(
            title: Text('${newsList[index].title}'),
            subtitle: Text('${newsList[index].title}'),
            trailing: Text(formatDate(newsList[index].time,)), // Assuming 'time' is a key in your newsList items
          );
                  },
                ),

    );
  }
}
