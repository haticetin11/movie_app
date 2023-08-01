import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:movie_app/models/trend_tv_model.dart';
import 'package:movie_app/services/api_services.dart';

class GetTvDBcontroller extends GetxController {
  bool isLoading = true;
  List<TrendTvModel> tvlist = [];
  final TvService _apiService = TvService();
  @override
  void onInit() {
    super.onInit();

    getShows();
  }

  Future<List<TrendTvModel>> getShows() async {
    _apiService.getAllData().then((value) async {
      if (value != false) {
        for (var item in value) {
          tvlist.add(TrendTvModel.fromJson(item));
        }

        isLoading = false;
        log(json.decode((tvlist.toString())));

        update();
      } else {
        update();
      }
    });

    return tvlist;
  }
}
