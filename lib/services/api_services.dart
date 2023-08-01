import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TvService {
  var baseUrl =
      "https://api.themoviedb.org/3/trending/tv/week?api_key=aa2be86b7d271fee3bd31439452f35de&language=tr-TR";

  Future getAllData() async {
    var url = Uri.parse("${baseUrl}");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var map = json.decode(response.body);

      return map['results'];
    } else {
      if (kDebugMode) {
        print('Error When Get Api');
      }

      return false;
    }
  }
}
