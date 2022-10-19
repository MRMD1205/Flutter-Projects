import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit_demo_flutter/models/post_data_model.dart';
import 'package:retrofit_demo_flutter/models/post_model.dart';
import 'package:retrofit_demo_flutter/network/api_client.dart';

class UserRepository {
  static final UserRepository _singletonUserRepository =
      UserRepository._internal();

  factory UserRepository() {
    return _singletonUserRepository;
  }

  UserRepository._internal();

  Future<List<PostModel>> userInfo() async {
    return await ApiClient(Dio()).getPosts();
  }

  Future<PostDataModel> postData(PostDataModel postDataModel) async {
    return await ApiClient(Dio()).createPost(postDataModel);
  }

// Future<List<PostModel>> userInfo(int userId) async {
//   return await ApiClient(Dio()).getPosts(userId);
// }

  Future<dynamic> uploadImage(Map<String, dynamic> map) async {
    return await ApiClient(Dio(),
            baseUrl: 'http://5.77.39.57:50091/api/Survey/')
        .uploadImage(map);
  }
}
