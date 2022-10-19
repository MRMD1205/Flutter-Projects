import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/controllers/dashboard_controller.dart';
import 'package:movie_list/util/app_constants.dart';
import 'package:movie_list/util/color_constants.dart';
import 'package:movie_list/util/dimensions.dart';
import 'package:movie_list/util/styles.dart';
import 'package:movie_list/view/list_item_view.dart';

class Dashboard extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.splashScreenColor,
        title: Text(AppConstants.DASHBOARD,
            style: poppinsBold.copyWith(
              fontSize: Dimensions.fontSize18,
              color: ColorConstants.blackColor,
            )),
      ),
      body: Obx   (() {
        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
                  _scrollController.position.maxScrollExtent &&
              _dashboardController.currentPage !=
                  _dashboardController?.totalPages) {
            _dashboardController.currentPage++;
            _dashboardController
                .refreshMovies(_dashboardController.currentPage);
          }
        });
        return Container(
          height: Dimensions.screenHeight,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _dashboardController.noLoader.value
                ? _dashboardController?.moviesList?.length
                : _dashboardController?.moviesList?.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              if (_dashboardController.noLoader.value) {
                return ListItemView(
                  modelData: _dashboardController?.moviesList[index],
                );
              } else if (index == _dashboardController?.moviesList?.length &&
                  _dashboardController?.moviesList?.length > 0) {
                return _buildProgressIndicator();
              } else {
                return index >= 0 && _dashboardController?.moviesList.isNotEmpty
                    ? ListItemView(
                        modelData: _dashboardController?.moviesList[index],
                      )
                    : Container(
                        height: Dimensions.screenHeight,
                        child: _buildProgressIndicator());
              }
            },
          ),
        );
      }),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new CircularProgressIndicator(
          backgroundColor: ColorConstants.splashScreenColor,
          valueColor:
              new AlwaysStoppedAnimation<Color>(ColorConstants.whiteColor),
        ),
      ),
    );
  }
}
