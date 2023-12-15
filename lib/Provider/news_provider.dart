import 'package:flutter/material.dart';
import 'package:newsapp/Repository/local_news_repository.dart';
import 'package:newsapp/Repository/news_repository.dart';
import 'package:newsapp/models/news_models.dart';

//Provider class for screen updates
class NewsProvider extends ChangeNotifier {
  List<NewsModel> listSaved = [];
  List<NewsModel> listNotice = [];
  bool isLoaded = false;
  bool fav = false;

  //Constructor to fetch data from Hive and feed into provider variable
  NewsProvider() {
    getAllSaves();
    getApi();
  }

  //Function to feed variable with API data
  void getApi() async {
    listNotice = List.from(await NewsRepository.getAllNews());
    isLoaded = true;
    notifyListeners();
  }

  //Function to fetch data from Hive
  Future<void> getAllSaves() async {
    List<Map<String, dynamic>> savedValues = [];
    for (var value in LocalNewsRepository.box.values) {
      if (value is Map<dynamic, dynamic>) {
        savedValues.add(Map<String, dynamic>.from(value));
      }
    }
    listSaved = savedValues.map((value) => NewsModel.fromJson(value)).toList();
    notifyListeners();
  }

  //Save news to Hive
  void saveNews(var model, int index) async {
    LocalNewsRepository.saveNews(model, index);

    refreshList();
    notifyListeners();
  }

  //Update new news in the screen
  void refreshList() {
    List<Map<String, dynamic>> savedValues = [];
    for (var value in LocalNewsRepository.box.values) {
      if (value is Map<String, dynamic>) {
        savedValues.add(Map<String, dynamic>.from(value));
      }
    }
    listSaved.add(NewsModel.fromJson(savedValues[savedValues.length - 1]));
  }

  //Remove news in thw screen
  void removeNews(int index) {
    listSaved.removeAt(index);
    LocalNewsRepository.deleteNews(index);
    notifyListeners();
  }
}
