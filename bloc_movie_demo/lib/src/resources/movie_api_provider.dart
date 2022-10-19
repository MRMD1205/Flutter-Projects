import 'dart:async';
import 'dart:convert';

import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/util/app_constants.dart';
import 'package:http/http.dart' show Client, Response;

import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  var _apiKey = 'f3bd2972ff18fb5a27642376d95dc972';
  var _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    Response response;
    if (_apiKey != 'api-key') {
      response =
          await client.get(Uri.parse(_baseUrl + "/popular?api_key=" + _apiKey));
    } else {
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response = await client
        .get(Uri.parse("$_baseUrl/$movieId/videos?api_key=$_apiKey"));

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
