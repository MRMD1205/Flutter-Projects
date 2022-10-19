import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_list/models/movie_data_model.dart';
import 'package:movie_list/util/app_constants.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<MovieDataModel> fetchMovies(int pageIndex) async {
    var response =
        await client.get(Uri.parse(AppConstants.API + pageIndex.toString()));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return MovieDataModel.fromJson(jsonDecode(jsonString));
    } else {
      //show error message
      return null;
    }
  }
}
