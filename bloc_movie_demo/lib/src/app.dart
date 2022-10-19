import 'package:bloc_movie_demo/src/ui/movie_list.dart';
import 'package:bloc_movie_demo/src/ui/vegetable_list.dart';
import 'package:bloc_movie_demo/src/util/color_constants.dart';
import 'package:bloc_movie_demo/src/util/dimensions.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorConstants.appColor
      ),
      home: Scaffold(
        body: VegetableList(),
      ),
    );
  }
}
