import 'dart:convert';
import 'package:newsapp/models/news_models.dart';
import 'package:http/http.dart' as http;

//News API handling
class NewsRepository {
  static List<NewsModel> list = [];
  static Future<List<NewsModel>> getAllNews() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=keyword&apiKey=be46651faf184828b5c9e76a04fc3a9a'),
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        var articles = json['articles'];

        for (var i in articles) {
          list.add(NewsModel.fromJson(i));
        }
        return list;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
