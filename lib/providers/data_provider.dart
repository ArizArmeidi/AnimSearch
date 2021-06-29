import 'package:anim_search/models/anime_model.dart';
import 'package:anim_search/models/home_card_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  List<HomeCardModel> searchList = [];
  late AnimeModel animeData = AnimeModel();

  Future<void> getHomeData() async {
    final String url = 'https://api.jikan.moe/v3/top/anime/1/upcoming';
    try {
      isLoading = true;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['top'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print(searchList.length);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  Future<void> searchData(String query) async {
    final String url =
        'https://api.jikan.moe/v3/search/anime?q=$query&page=1&limit=12';
    try {
      isLoading = true;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['results'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print(searchList.length);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  Future<void> getAnimeData(int malId) async {
    final String url = 'https://api.jikan.moe/v3/anime/$malId';
    try {
      isLoading = true;
      var dio = Dio();
      var response = await dio.get(url);
      print(response);
      animeData = AnimeModel.fromJson(response.data);
      print(animeData);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }
}
