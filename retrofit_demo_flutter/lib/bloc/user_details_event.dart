import 'package:retrofit_demo_flutter/models/post_data_model.dart';

abstract class UserDetailsEvent {
  const UserDetailsEvent();
}

class FetchUserDetailsEvent extends UserDetailsEvent {
  // final int userId;
  //
  // FetchUserDetailsEvent({required this.userId}) : assert(userId != null);
  FetchUserDetailsEvent();
}

class PostUserDetailsEvent extends UserDetailsEvent {
  PostDataModel postDataModel;

  PostUserDetailsEvent({required this.postDataModel})
      : assert(postDataModel != null);
}

class ChoseImageEvent extends UserDetailsEvent {
  ChoseImageEvent();
}

class UploadImageEvent extends UserDetailsEvent {
  Map<String, dynamic> map;

  UploadImageEvent({required this.map});
}
