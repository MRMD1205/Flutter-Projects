import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retrofit_demo_flutter/bloc/user_details_bloc.dart';
import 'package:retrofit_demo_flutter/bloc/user_details_event.dart';
import 'package:retrofit_demo_flutter/bloc/user_details_state.dart';
import 'package:retrofit_demo_flutter/models/post_model.dart';
import 'dart:io';

import 'package:retrofit_demo_flutter/widgets/image_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late ScrollController _scrollController;
  int userId = 1;
  late List<PostModel> totalItemList;

  late UserDetailsLoadedState userDetailsSuccessState;
  late UserDetailsBloc userDetailsBloc;

  // Image Picker
  late File? imageFile;
  late ImagePicker _picker;
  bool _inProcess = false;

  @override
  void initState() {
    super.initState();
    userDetailsBloc = UserDetailsBloc();
    imageFile = null;
    _picker = ImagePicker();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController = new ScrollController();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _loadMore();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Page'),
        ),
        body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          bloc: BlocProvider.of<UserDetailsBloc>(context),
          builder: (context, state) {
            print('State is $state');
            if (state is UserDetailsLoading) {
              print('State is $state');
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserDetailsLoadedState) {
              print('State is $state');
              // userId = state.userId;
              userDetailsSuccessState = state;
              totalItemList = state.postModelList;
              return ListView.builder(
                  // controller: _scrollController,
                  itemCount: state.postModelList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [BoxShadow(color: Colors.grey)],
                            color: Colors.white70),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 90,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'ID :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Text(state.postModelList[index].id
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Title :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Text(
                                          state.postModelList[index].title),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Body :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child:
                                          Text(state.postModelList[index].body),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'UserId :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Text(state.postModelList[index].userId
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 90,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is UserDetailsUploadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('UserId : ${state.postDataModelList.userId}'),
                    Text('ID : ${state.postDataModelList.id}'),
                    Text('Title : ${state.postDataModelList.title}'),
                    Text('Text : ${state.postDataModelList.text}'),
                  ],
                ),
              );
            }
            if (state is ChoseImageState) {
              print('inProcess : $_inProcess');
              return Scaffold(
                body: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageWidget(
                          imageFile: imageFile,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()),
                                );
                              },
                              child: Text('Select Image'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(color: Colors.blue))),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (imageFile == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Please select image"),
                                    action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar),
                                  ));
                                } else {
                                  print('Path : ${imageFile?.path}');
                                  Map<String, dynamic> map = {
                                    'SurveyPicId': '0',
                                    'SurveyId': '1',
                                    'PictureName': imageFile!.path,
                                    'CreatedBy': '4',
                                    'ImageData': imageFile,
                                  };
                                  BlocProvider.of<UserDetailsBloc>(context)
                                      .add(UploadImageEvent(map: map));
                                }
                              },
                              child: Text('Upload Image'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    (_inProcess)
                        ? Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.95,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Center(),
                  ],
                ),
              );
            }
            if (state is UploadImageState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Success : ${state.response.success.toString()}'),
                    Text('Message : ${state.response.message}'),
                  ],
                ),
              );
            }
            if (state is UserDetailsError) {
              return Center(
                child: Text(state.e.toString()),
              );
            }
            return Container(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

// void _loadMore() {
//   if (userDetailsSuccessState != null &&
//       userDetailsSuccessState.postModelList != null) {
//     int maxUserId = 100;
//     if (userId < maxUserId) {
//       BlocProvider.of<UserDetailsBloc>(context)
//           .add(FetchUserDetailsEvent(userId: ++userId));
//     }
//   }
// }

  void _pickImage(ImageSource source) async {
    PickedFile? pickedFile = await _picker.getImage(source: source);
    imageFile = File(pickedFile!.path);
    //cropping image
    if (imageFile != null) {
      _cropImage();
      setState(() {
        _inProcess = true;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  Future _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        // aspectRatioPresets: Platform.isAndroid
        //     ? [
        //         CropAspectRatioPreset.square,
        //         CropAspectRatioPreset.ratio3x2,
        //         CropAspectRatioPreset.original,
        //         CropAspectRatioPreset.ratio4x3,
        //         CropAspectRatioPreset.ratio16x9
        //       ]
        //     : [
        //         CropAspectRatioPreset.original,
        //         CropAspectRatioPreset.square,
        //         CropAspectRatioPreset.ratio3x2,
        //         CropAspectRatioPreset.ratio4x3,
        //         CropAspectRatioPreset.ratio5x3,
        //         CropAspectRatioPreset.ratio5x4,
        //         CropAspectRatioPreset.ratio7x5,
        //         CropAspectRatioPreset.ratio16x9
        //       ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            backgroundColor: Color(0xFFE5E5E5),
            toolbarColor: Color(0xFFE5E5E5),
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        ));
    if (croppedFile != null) {
      setState(() {
        _inProcess = false;
        imageFile = croppedFile;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 9,
      width: double.maxFinite,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
      child: Column(
        children: [
          Text(
            'Choose Image',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                      onTap: () {
                        _pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: Text('Camera')),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Text('Gallery')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
