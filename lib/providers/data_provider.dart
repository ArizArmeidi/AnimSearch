import 'package:anim_search/models/home_card_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  List<HomeCardModel> searchList = [];

  Future<void> getHomeData() async {
    final String url =
        'https://api.jikan.moe/v3/search/anime?q=yourlieinapril&page=1&limit=12';

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
      print(e);
    }
  }
}
