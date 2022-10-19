
import 'dart:async';
import 'dart:convert';

import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/util/app_constants.dart';
import 'package:http/http.dart' show Client, Response;

class VegetableProvider{
  Client client = Client();

  Future<ResponseDataModel> fetchVegetableList() async {

    Response response;
    response = await client.post(Uri.parse(AppConstants.API_PRACTICAL_DATA));

    if (response.statusCode == 200) {
      return ResponseDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }

}

