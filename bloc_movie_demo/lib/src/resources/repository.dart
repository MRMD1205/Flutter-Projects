import 'dart:async';
import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/resources/vegetable_api_provider.dart';

import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final vegetableApiProvider=VegetableProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);


  Future<ResponseDataModel> fetchAllVegetables() => vegetableApiProvider.fetchVegetableList();

}
