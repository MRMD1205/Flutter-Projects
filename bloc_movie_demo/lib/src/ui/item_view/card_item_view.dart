import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/util/color_constants.dart';
import 'package:bloc_movie_demo/src/util/dimensions.dart';
import 'package:bloc_movie_demo/src/util/images.dart';
import 'package:bloc_movie_demo/src/util/styles.dart';
import 'package:flutter/material.dart';

class CardItemView extends StatelessWidget {
  final Data productList;

  CardItemView(this.productList);

  @override
  Widget build(BuildContext context) {
    final double circleRadius = 120.0;
    return GestureDetector(
      onTap: () {
        // Get.to(ItemDetailScreen(productList:productList,));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 4),
            child: Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2, top: 5),
                      child: Text(productList.title.toString(),
                          style: poppinsBold.copyWith(
                            fontSize: 16,
                            color: ColorConstants.blackColor,
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text("₹" + productList.price.toString(),
                            style: poppinsBold.copyWith(
                              fontSize: 18,
                              color: Colors.red,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(productList.description.toString(),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: poppinsRegular.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: ColorConstants.blackColor.withOpacity(0.5),
                          )),
                    )
                  ],
                ),
              ),

              // Some content
            ),
          ),
          Container(
            width: circleRadius,
            height: circleRadius,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5, right: 5, bottom: Dimensions.screenHeight / 25),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    image: DecorationImage(
                        image: AssetImage(Images.item_image_potato))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
