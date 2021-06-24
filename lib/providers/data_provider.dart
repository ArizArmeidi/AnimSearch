import 'dart:developer';

import 'package:anim_search/models/home_card_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  List<HomeCardModel> searchList = [];

  Future<void> getHomeData() async {
    final String url =
        'https://api.jikan.moe/v3/search/anime?q=nagatoro&page=1';

    try {
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['results'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
    } catch (e) {
      print(e);
    }
  }
}
