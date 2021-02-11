// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// List<String> imageLinks = [
//   'https://semiqolon.com/car/1st-view.png',
//   'https://semiqolon.com/car/2nd-view.png',
//   'https://semiqolon.com/car/3rd-view.png',
//   'https://semiqolon.com/car/4th-view.png'
// ];

// class DetailCoursel extends StatefulWidget {
//   @override
//   _DetailCourselState createState() => _DetailCourselState();
// }

// class _DetailCourselState extends State<DetailCoursel> {
//   CarouselController buttonCarouselController = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 200.0,
//               aspectRatio: 16 / 9,
//               viewportFraction: 1,
//             ),
//             carouselController: buttonCarouselController,
//             items: imageLinks.map((imageLink) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Image.network(
//                         imageLink,
//                         fit: BoxFit.cover,
//                       ));
//                 },
//               );
//             }).toList(),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 60.0,
//               autoPlay: false,
//               aspectRatio: 16 / 9,
//               enableInfiniteScroll: true,
//               viewportFraction: 0.3,
//             ),
//             items: imageLinks.map((imageLink) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       child: InkWell(
//                         child: Image.network(
//                           imageLink,
//                           fit: BoxFit.cover,
//                         ),
//                         onTap: () {
//                           print(imageLinks.indexOf(imageLink));
//                           setState(() {
//                             buttonCarouselController
//                                 .jumpToPage(imageLinks.indexOf(imageLink));
//                           });
//                         },
//                       ));
//                 },
//               );
//             }).toList(),
//           )
//         ]);
//   }
// }
