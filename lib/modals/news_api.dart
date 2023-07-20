import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'categories_model.dart';
import 'news_model.dart';

class NewsApi with ChangeNotifier {
  List<News> _news = [];

  List<News> get news {
    return [..._news];
  }

  List<Category> categories = [
    Category(
        id: "1",
        name: "Sports",
        imageUrl:
            "https://media.nature.com/lw800/magazine-assets/d41586-021-00814-5/d41586-021-00814-5_19015374.jpg",
        keyword: "sport"),
    Category(
        id: "2",
        name: "Business",
        imageUrl: "https://learn.g2.com/hubfs/iStock-685053710.jpg",
        keyword: "business"),
    Category(
        id: "3",
        name: "Technology",
        imageUrl:
            "https://learn.g2.com/hubfs/What_is_Information_Technology.jpg",
        keyword: "technology"),
    Category(
        id: "4",
        name: "Education",
        imageUrl:
            "https://img.freepik.com/free-photo/front-view-stacked-books-graduation-cap-diploma-education-day_23-2149241011.jpg",
        keyword: "education")
  ];

  Future<void> fetchAndSetNews(String type) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$type&language=en&sortBy=publishedAt&apiKey=2f3cf0f4a85b475dbb8a9b0d043e0c1a');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      List newsList = extractedData.values.elementAt(2);
      final List<News> loadedNews = [];
      for (var news in newsList) {
        loadedNews.add(News(
          id: DateTime.now().toString(),
          name: type,
          description: news['description'] ?? "NotAvailable",
          content: news['content'] ?? "NotAvailable",
          url: news['url'] ?? "NotAvailable",
          urlToImage: news['urlToImage'] ?? "NotAvailable",
          title: news['title'] ?? "NotAvailable",
          author: news['author'] ?? "NotAvailable",
          publishedAt: news['publishedAt'] ?? "NotAvailable",
        ));
      }
      // newsList.forEach((newsId, newsData) {
      //   loadedNews.add(News(
      //     id: newsId,
      //     name: newsData['title'],
      //     description: newsData['description'],
      //     content: newsData['content'],
      //     url: newsData['url'],
      //     urlToImage: newsData['urlToImage'],
      //     title: newsData['title'],
      //     author: newsData['author'],
      //     publishedAt: newsData['publishedAt'],
      //   ));
      // });
      _news = loadedNews;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
