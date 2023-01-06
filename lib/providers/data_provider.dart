import 'package:anim_search/constants.dart';
import 'package:anim_search/models/anime_model.dart';
import 'package:anim_search/models/home_card_model.dart';
import 'package:anim_search/models/recommendation_model.dart';
import 'package:anim_search/types/category_type.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';
  List<HomeCardModel> searchList = [];
  List<RecommendationModel> recommendationList = [];
  late int genreId;
  late AnimeModel animeData = AnimeModel();

  Future<void> getHomeData({CategoryType category = CategoryType.top}) async {
    final String url;

    switch (category) {
      case CategoryType.top:
        url = top_url;
        break;
      case CategoryType.upcoming:
        url = upcoming_url;
        break;
      case CategoryType.series:
        url = series_url;
        break;
      case CategoryType.movie:
        url = movie_url;
        break;
      case CategoryType.ova:
        url = ova_url;
        break;
      case CategoryType.special:
        url = special_url;
        break;
    }

    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['data'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print(searchList.length);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchData(String query) async {
    final String url = Uri.encodeFull(api_url + '?q=$query&page=1&limit=12');
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['data'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAnimeData(int malId) async {
    final String url = 'https://api.jikan.moe/v4/anime/$malId';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      animeData = AnimeModel.fromJson(response.data['data']);
      await getRecommendationData(animeData.genreId);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRecommendationData(int genreId) async {
    final String url = 'https://api.jikan.moe/v3/genre/anime/$genreId/1';
    try {
      isLoading = true;
      isError = false;
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
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occured Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
