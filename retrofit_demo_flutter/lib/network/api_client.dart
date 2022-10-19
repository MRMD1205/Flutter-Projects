import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_demo_flutter/models/post_data_model.dart';
import 'package:retrofit_demo_flutter/models/post_model.dart';
import 'package:retrofit_demo_flutter/models/response_model.dart';

import 'api.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //GET method
  @GET(Api.posts)
  Future<List<PostModel>> getPosts();

  //list according particular userId using GET method
// @GET(Api.posts)
// Future<List<PostModel>> getPosts(@Query('userId') int userId);

  //POST method
  @POST(Api.posts)
  Future<PostDataModel> createPost(@Body() PostDataModel post);

  //Map<String, dynamic> map = {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbEFkZHJlc3MiOiJBZG1pbkAxMjMuY29tIiwibmJmIjoxNjQxOTc2MzU1LCJleHAiOjE2NTM5NzI3NTUsImlhdCI6MTY0MTk3NjM1NX0.G8qsFwbXS2EMrQotKm9_SdcSWJLTxFzbhUk3iq4bHD0'};
  @POST('SaveSurveyPicture')
  Future<ResponseModel> uploadImage(@Part() Map<String, dynamic> map);
}
