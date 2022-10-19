import 'package:flutter/material.dart';


Widget gridViewConstant(int listLength,BuildContext context,Widget view)=>GridView.builder(
  physics: BouncingScrollPhysics(),
  padding: const EdgeInsets.all(25),
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 0.650 / 1,
    crossAxisSpacing: 28,
    mainAxisSpacing: 20,
  ),
  shrinkWrap: true,
  itemCount: listLength,
  itemBuilder: ( context, int index) {
    return view;
  },
);