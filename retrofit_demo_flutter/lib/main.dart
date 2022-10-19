import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_demo_flutter/models/post_data_model.dart';
import 'package:retrofit_demo_flutter/pages/user_page.dart';

import 'bloc/user_details_bloc.dart';
import 'bloc/user_details_event.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserDetailsBloc userDetailsBloc;

  @override
  void initState() {
    super.initState();
    userDetailsBloc = UserDetailsBloc();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //POST method call
  //   // PostDataModel postDataModel = PostDataModel(12, 'TITLE', "TEXT");
  //   // userDetailsBloc.add(PostUserDetailsEvent(postDataModel: postDataModel));
  //
  //   //GET method call
  //   userDetailsBloc.add(FetchUserDetailsEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => userDetailsBloc,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('Retrofit Demo'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      userDetailsBloc.add(FetchUserDetailsEvent());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                  value: userDetailsBloc, child: UserPage())));
                    },
                    child: Text('GET method'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.blue))),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      PostDataModel postDataModel =
                          PostDataModel(12, 'TITLE', "TEXT");
                      userDetailsBloc.add(
                          PostUserDetailsEvent(postDataModel: postDataModel));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                  value: userDetailsBloc, child: UserPage())));
                    },
                    child: Text('POST method'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.blue))),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      userDetailsBloc.add(ChoseImageEvent());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                  value: userDetailsBloc, child: UserPage())));
                    },
                    child: Text('UPLOAD Image'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.blue))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
