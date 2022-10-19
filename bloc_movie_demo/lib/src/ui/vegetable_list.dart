import 'package:bloc_movie_demo/src/blocs/movies_bloc.dart';
import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/ui/item_view/card_item_view.dart';
import 'package:bloc_movie_demo/src/util/color_constants.dart';
import 'package:bloc_movie_demo/src/util/dimensions.dart';
import 'package:bloc_movie_demo/src/util/styles.dart';
import 'package:flutter/material.dart';

class VegetableList extends StatefulWidget {
  const VegetableList({Key? key}) : super(key: key);

  @override
  _VegetableListState createState() => _VegetableListState();
}

class _VegetableListState extends State<VegetableList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllVegetablesDetails();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.screenWidth / 30,
                  top: Dimensions.screenHeight / 12,
                  bottom: Dimensions.screenHeight / 40),
              child: Text('Vegetables',
                  style: poppinsBold.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge,
                    color: ColorConstants.blackColor,
                  )),
            ),
            StreamBuilder(
              stream: bloc.allVegetablesData,
              builder: (context, AsyncSnapshot<ResponseDataModel> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: Dimensions.screenHeight,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: Dimensions.screenHeight / 7),
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(25),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.650 / 1,
                          crossAxisSpacing: 28,
                          mainAxisSpacing: 20,
                        ),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardItemView(snapshot.data!.data[index]);
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Container(
                    height: Dimensions.screenHeight / 1.5,
                    child: Center(child: CircularProgressIndicator()));
              },
            )
          ],
        ),
      ),
    );
  }
}
