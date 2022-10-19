// import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class ItemDetailScreen extends StatelessWidget {
//   Data productList;
//
//   ItemDetailScreen({this.productList});
//
//   @override
//   Widget build(BuildContext context) {
//     final split = productList.vitamins.split(',');
//     final Map<int, String> vitamins = {
//       for (int i = 0; i < split.length; i++) i: split[i]
//     };
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   if (productList.images.toString() == null)
//                     Padding(
//                       padding: EdgeInsets.only(top: 30),
//                       child: Container(
//                         child: Image.asset(
//                           Images.error_img,
//                           height: 200,
//                           width: double.infinity,
//                         ),
//                       ),
//                     )
//                   else if (productList.images is String)
//                     Padding(
//                         padding: EdgeInsets.only(top: 30),
//                         child: Container(
//                           height: 200,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(productList.images),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ))
//                   else if (productList.images is List<dynamic>)
//                       Padding(
//                         padding: EdgeInsets.only(top: 30),
//                         child: Container(
//                           child: CarouselSlider(
//                             items: [
//                               //1st Image of Slider
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(productList.images[0]),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//
//                             //Slider Container properties
//                             options: CarouselOptions(
//                               height: 200.0,
//                               enlargeCenterPage: false,
//                               autoPlay: true,
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               enableInfiniteScroll: true,
//                               viewportFraction: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           productList.title,
//                           textScaleFactor: 1.0,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Poppins",
//                               fontSize: 20),
//                         ),
//                         Text(
//                           "₹" + productList.price.toString(),
//                           textScaleFactor: 1.0,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                               fontFamily: "Poppins",
//                               fontSize: 20),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Text(
//                       "Vitamins",
//                       textScaleFactor: 0.8,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "Poppins",
//                           color: Colors.black,
//                           fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Row(
//                       children: [
//                         for (int i = 0; i < vitamins.length; i++)
//                           vitaminWidgets(vitamins[i]),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Text(
//                       "Minerals ",
//                       textScaleFactor: 0.8,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: "Poppins",
//                           fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 10, right: 30),
//                     child: Text(
//                       productList.minerals,
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey,
//                           fontFamily: "Poppins",
//                           fontSize: 14),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Text(
//                       "Description",
//                       textScaleFactor: 0.8,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "Poppins",
//                           color: Colors.black,
//                           fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 10, right: 30),
//                     child: Text(
//                       productList.description,
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey,
//                           fontFamily: "Poppins",
//                           fontSize: 15),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Text(
//                       "Pros",
//                       textScaleFactor: 0.8,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 18),
//                     ),
//                   ),
//                   for (int i = 0; i < productList.pros.length; i++)
//                     generateTextSpan(Images.green_arrow, productList.pros[i]),
//                   Padding(
//                     padding: EdgeInsets.only(left: 30, top: 30, right: 30),
//                     child: Text(
//                       "Cons",
//                       textScaleFactor: 0.8,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 18),
//                     ),
//                   ),
//                   for (int i = 0; i < productList.cons.length; i++)
//                     generateTextSpan(Images.red_arrow, productList.cons[i]),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget generateTextSpan(String img, String txt) {
//     return Padding(
//       padding: EdgeInsets.only(left: 40, top: 10, right: 30),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Padding(
//                   child: Image.asset(
//                     img,
//                     height: 10,
//                     width: 10,
//                   ),
//                   padding: EdgeInsets.only(top: 6),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10, top: 1),
//                     child: Text(
//                       txt,
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           color: Colors.grey,
//                           fontFamily: "Poppins",
//                           fontSize: 12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget vitaminWidgets(String vitaminTxt) {
//     return Container(
//       height: 38,
//       width: 38,
//       child: Card(
//         color: Colors.grey.shade300,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(
//             child: Text(
//               vitaminTxt,
//               style: TextStyle(
//                   color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
//             )),
//       ),
//     );
//   }
// }
