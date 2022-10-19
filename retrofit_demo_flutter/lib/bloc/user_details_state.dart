import 'package:retrofit_demo_flutter/models/post_data_model.dart';
import 'package:retrofit_demo_flutter/models/post_model.dart';
import 'package:retrofit_demo_flutter/models/response_model.dart';

class UserDetailsState {}

class UserDetailsInitialState extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoadedState extends UserDetailsState {
  List<PostModel> postModelList;

  // int userId;
  // UserDetailsLoadedState(this.postModelList,this.userId);
  UserDetailsLoadedState(this.postModelList);
}

class UserDetailsUploadedState extends UserDetailsState {
  PostDataModel postDataModelList;

  // int userId;
  // UserDetailsLoadedState(this.postModelList,this.userId);
  UserDetailsUploadedState(this.postDataModelList);
}

class UserDetailsError extends UserDetailsState {
  var e;

  UserDetailsError(this.e);
}

class ChoseImageState extends UserDetailsState {}

class UploadImageState extends UserDetailsState {
  ResponseModel response;

  UploadImageState(this.response);
}
