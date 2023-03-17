// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CoursesPages extends StatefulWidget {
//   final String languageName;
//
//   const CoursesPages({Key? key, required this.languageName}) : super(key: key);
//
//   @override
//   _CoursesPagesState createState() => _CoursesPagesState();
// }
//
// class _CoursesPagesState extends State<CoursesPages> {
//   late Stream<QuerySnapshot> courses;
//   bool isLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     courses = FirebaseFirestore.instance
//         .collection('courses')
//         .where('language', isEqualTo: widget.languageName)
//         .snapshots();
//     if (courses != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF5F5F5),
//       body: Visibility(
//         visible: isLoaded,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.blueGrey,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               widget.languageName.toUpperCase(),
//                               style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(width: 24),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Programming Language',
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 30,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'Learn ${widget
//                               .languageName} programming language through our curated courses and improve your skills.',
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     'Explore Courses',
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 StreamBuilder<QuerySnapshot>(
//                     stream: courses,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       // if (snapshot.hasError) {
//                         return Container(
//                           child: AnimationLimiter(
//                             child: ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: snapshot.data!.docs.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return AnimationConfiguration.staggeredList(
//                                   position: index,
//                                   duration: const Duration(milliseconds: 375),
//                                   child: SlideAnimation(
//                                     verticalOffset: 50.0,
//                                     child: FadeInAnimation(
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           // Navigator.push(
//                                           // context,
//                                           // MaterialPageRoute(
//                                           // builder: (BuildContext context) => CourseDetailsPage(
//                                           // courseName: snapshot.data!.docs[index]['name'],
//                                           // courseDescription: snapshot.data!.docs[index]['description'],
//                                           // courseDifficulty: snapshot.data!.docs[index]['difficulty'],
//                                           // courseImage: snapshot.data!.docs[index]['image'],
//                                           // courseLanguage: snapshot.data!.docs[index]['language'],
//                                           // ),
//                                           // ),
//                                           // );
//                                         },
//                                         child: Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 16, right: 16, bottom: 16),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius
//                                                   .circular(16),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black
//                                                       .withOpacity(0.1),
//                                                   blurRadius: 10,
//                                                   offset: Offset(0, 5),
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(16),
//                                               child: Row(
//                                                 children: [
//                                                   ClipRRect(
//                                                     borderRadius: BorderRadius
//                                                         .circular(16),
//                                                     child: Image.network(
//                                                       snapshot.data!
//                                                           .docs[index]['image'],
//                                                       height: 80,
//                                                       width: 80,
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                   SizedBox(width: 16),
//                                                   Expanded(
//                                                     child: Column(
//                                                       crossAxisAlignment: CrossAxisAlignment
//                                                           .start,
//                                                       children: [
//                                                         Text(
//                                                           snapshot.data!
//                                                               .docs[index]['name'],
//                                                           style: GoogleFonts
//                                                               .poppins(
//                                                             color: Colors.black,
//                                                             fontWeight: FontWeight
//                                                                 .w600,
//                                                             fontSize: 18,
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 8),
//                                                         Text(
//                                                           snapshot.data!
//                                                               .docs[index]['description'],
//                                                           maxLines: 3,
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                           style: GoogleFonts
//                                                               .poppins(
//                                                             color: Colors
//                                                                 .grey[600],
//                                                             fontWeight: FontWeight
//                                                                 .w400,
//                                                             fontSize: 14,
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 8),
//                                                         Row(
//                                                           children: [
//                                                             Icon(
//                                                               Icons.star,
//                                                               color: Colors
//                                                                   .yellow[700],
//                                                               size: 16,
//                                                             ),
//                                                             SizedBox(width: 4),
//                                                             Text(
//                                                               snapshot.data!
//                                                                   .docs[index]['difficulty'],
//                                                               style: GoogleFonts
//                                                                   .poppins(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight: FontWeight
//                                                                     .w400,
//                                                                 fontSize: 14,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         );
//                       // }
//                       return Text('');
//                     }),
//               ],
//             ),
//           ),
//         ),
//         replacement: Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
//
//
//
