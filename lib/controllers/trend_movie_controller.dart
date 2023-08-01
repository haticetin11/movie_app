import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:movie_app/services/api_services_movie.dart';

import '../models/trend_movie_model.dart';

class GetMovieDBcontroller extends GetxController {
  bool isLoading = true;
  List<TrendMovieModel> tvlist = [];
  final MovieService _apiService = MovieService();
  @override
  void onInit() {
    super.onInit();

    getShows();
  }

  Future<List<TrendMovieModel>> getShows() async {
    _apiService.getAllData().then((value) async {
      if (value != false) {
        for (var item in value) {
          tvlist.add(TrendMovieModel.fromJson(item));
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
