// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:learn_programming/widgets/institutes_button.dart';
// import 'package:learn_programming/widgets/language_button.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// class HomePages extends StatefulWidget {
//   const HomePages({Key? key}) : super(key: key);
//
//   @override
//   State<HomePages> createState() => _HomePagesState();
// }
//
// class _HomePagesState extends State<HomePages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: false,
//         backgroundColor: Colors.white,
//         bottomNavigationBar: GNav(
//           backgroundColor: Colors.white,
//           gap: 4.0,
//           activeColor: Colors.black,
//           iconSize: 24.0,
//           padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//           tabs: [
//             GButton(
//               icon: Icons.home,
//               text: 'Home',
//               textStyle: TextStyle(fontSize: 16.0),
//             ),
//             GButton(
//               icon: Icons.search,
//               text: 'Search',
//               textStyle: TextStyle(fontSize: 16.0),
//             ),
//             GButton(
//               icon: Icons.favorite,
//               text: 'Favourite',
//               textStyle: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//         body: Container(
//           color: Colors.white,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 300.0,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFFDD807),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30.0),
//                           bottomRight: Radius.circular(30.0),
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 60.0),
//                           Text(
//                             'Learn Programming',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 30.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 10.0),
//                           Text(
//                             'Discover a new world of programming languages',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           SizedBox(height: 40.0),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16.0),
//                             child: TextField(
//                               style: TextStyle(color: Colors.black),
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 hintText: 'Find a language',
//                                 prefixIcon: Icon(Icons.search),
//                                 prefixIconColor: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Positioned(
//                     //   bottom: 0.0,
//                     //   left: 0.0,
//                     //   right: 0.0,
//                     //   child: Container(
//                     //     margin: EdgeInsets.symmetric(horizontal: 40.0),
//                     //     height: 80.0,
//                     //     decoration: BoxDecoration(
//                     //       boxShadow: [
//                     //         BoxShadow(
//                     //           color: Colors.grey.shade600,
//                     //           spreadRadius: 0,
//                     //           blurRadius: 5,
//                     //           blurStyle: BlurStyle.normal,
//                     //         ),
//                     //       ],
//                     //       color: Colors.white,
//                     //       borderRadius: BorderRadius.circular(16.0),
//                     //     ),
//                     //     child: Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //       children: [
//                     //         Container(
//                     //           padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     //           child: Column(
//                     //             crossAxisAlignment: CrossAxisAlignment.start,
//                     //             mainAxisAlignment: MainAxisAlignment.center,
//                     //             children: [
//                     //               Text(
//                     //                 'Featured Languages',
//                     //                 style: TextStyle(
//                     //                   fontWeight: FontWeight.bold,
//                     //                   fontSize: 18.0,
//                     //                 ),
//                     //               ),
//                     //               SizedBox(height: 4.0),
//                     //               Text(
//                     //                 '20 languages available',
//                     //                 style: TextStyle(
//                     //                   fontWeight: FontWeight.normal,
//                     //                   fontSize: 14.0,
//                     //                   color: Colors.grey,
//                     //                 ),
//                     //               ),
//                     //             ],
//                     //           ),
//                     //         ),
//                     //         TextButton(
//                     //           onPressed: () {},
//                     //           child: Text(
//                     //             'View All',
//                     //             style: TextStyle(
//                     //               color: Colors.orange,
//                     //               fontSize: 14.0,
//                     //               fontWeight: FontWeight.bold,
//                     //             ),
//                     //           ),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 40.0,
//                 ),
//                 Positioned(
//                   bottom: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 40.0),
//                     height: 280.0,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade600,
//                           spreadRadius: 0,
//                           blurRadius: 5,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all( 16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Featured Languages',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18.0,
//                                 ),
//                               ),
//                               SizedBox(height: 4.0),
//                               Text(
//                                 '20 languages available',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   fontSize: 14.0,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               Languages()
//                             ],
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'View All',
//                             style: TextStyle(
//                               color: Colors.orange,
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//
//             ),
//           ),
//         )
//   );
//   }
// }
