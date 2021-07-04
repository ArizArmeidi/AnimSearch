import 'package:anim_search/models/anime_model.dart';
import 'package:anim_search/models/home_card_model.dart';
import 'package:anim_search/models/recommendation_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  List<HomeCardModel> searchList = [];
  List<RecommendationModel> recommendationList = [];
  late int genreId;
  late AnimeModel animeData = AnimeModel();

  Future<void> getHomeData() async {
    final String url = 'https://api.jikan.moe/v3/top/anime/1/airing';
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
      animeData = AnimeModel.fromJson(response.data);
      await getRecommendationData(animeData.genreId);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  Future<void> getRecommendationData(int genreId) async {
    final String url = 'https://api.jikan.moe/v3/genre/anime/$genreId/1';
    try {
      isLoading = true;
      var dio = Dio();
      var response = await dio.get(url);
      List<RecommendationModel> tempRecommendation = [];
      List items = response.data['anime'];
      tempRecommendation = items
          .map((data) => RecommendationModel.fromJson(data))
          .take(5)
          .toList();
      recommendationList = tempRecommendation;
      for (var i = 0; i != recommendationList.length; i++) {
        print(recommendationList[i].title);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }
}
