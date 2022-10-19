import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_demo_flutter/bloc/user_details_event.dart';
import 'package:retrofit_demo_flutter/bloc/user_details_state.dart';
import 'package:retrofit_demo_flutter/models/post_data_model.dart';
import 'package:retrofit_demo_flutter/models/post_model.dart';
import 'package:retrofit_demo_flutter/models/response_model.dart';
import 'package:retrofit_demo_flutter/network/user_repository.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserRepository userRepository = UserRepository();

  UserDetailsBloc() : super(UserDetailsState());

  @override
  UserDetailsState get initialState {
    return UserDetailsInitialState();
  }

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async* {
    yield UserDetailsLoading();
    if (event is FetchUserDetailsEvent) {
      print('Event is $event');
      try {
        List<PostModel> userResponseList = await userRepository.userInfo();
        yield UserDetailsLoadedState(userResponseList);
        // List<PostModel> userResponseList = await userRepository.userInfo(event.userId);
        // yield UserDetailsLoadedState(userResponseList,event.userId);
        print(userResponseList);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsError(e.toString());
      }
    }
    if (event is PostUserDetailsEvent) {
      print('Event is $event');
      try {
        PostDataModel postDataModelList =
            await userRepository.postData(event.postDataModel);
        yield UserDetailsUploadedState(postDataModelList);
        print(postDataModelList);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsError(e.toString());
      }
    }
    if (event is ChoseImageEvent) {
      print('Event is $event');
      try {
        yield ChoseImageState();
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsError(e.toString());
      }
    }
    if (event is UploadImageEvent) {
      print('Event is $event');
      try {
        ResponseModel response = await userRepository.uploadImage(event.map);
        yield UploadImageState(response);
        print('Success : ${response.success.toString()}');
        print('Message : ${response.message}');
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsError(e.toString());
      }
    }
  }
}
