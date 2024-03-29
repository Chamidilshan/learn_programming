import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learn_programming/models/languages_card_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';


class CoursesPage extends StatefulWidget {
  final LanguageCards languageCard;

  const CoursesPage({super.key, required this.languageCard});



  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late Stream<QuerySnapshot> courses;
  bool isLoaded = false;
  @override
  void initState(){
    super.initState();
    courses = FirebaseFirestore.instance.collection('courses').where('language', isEqualTo: '${widget.languageCard.name}').snapshots();
    if(courses!=null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Visibility(
        visible: isLoaded,
        child: SafeArea(
          child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
              stream: courses,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError){
                  return Center(child: Text('Something went wrong'));
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height /1.3,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.yellow,),
                    ),
                  );
                }

                final data = snapshot.requireData;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF373451),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  widget.languageCard.name.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 24),
                              ],
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              'Programming Language',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Learn ${widget.languageCard.name} programming language through our curated courses and improve your skills.',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Center(child: Image.asset('images/edited.png', width: 240.0,))
                          ],
                        ),
                      ),
                    ).animate().fade(duration: 800.ms),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF373451),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)
                          )
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Explore Courses',
                             style: GoogleFonts.poppins(
                               color: Colors.white,
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                             ),
                           ),
                          SizedBox(
                            height: 20.0,
                          ),
                          AnimationLimiter(
                            child: ListView.separated(physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,itemCount: data.size,shrinkWrap: true, itemBuilder: (context, index){
                               return AnimationConfiguration.staggeredList(
                                 position: index,
                                 duration: const Duration(milliseconds: 1000),
                                 child: SlideAnimation(
                                   verticalOffset: 50.0,
                                   child: FadeInAnimation(
                                     child: GestureDetector(
                                       onTap: () {print('Pressed');},
                                       child: Container(
                                         child: Padding(
                                           padding: const EdgeInsets.all(6.0),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Image.asset('images/code.png', width: 40.0,),
                                               SizedBox(
                                                 width: 10.0,
                                               ),
                                               Expanded(
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     SizedBox(height: 10.0),
                                                     Text(data.docs[index]['name'],
                                                         style: TextStyle(
                                                             fontWeight: FontWeight.w600
                                                         )
                                                     ),
                                                     SizedBox(
                                                       height: 4.0,
                                                     ),
                                                     Row(
                                                       children: [
                                                         Text(data.docs[index]['inst'],
                                                           style: TextStyle(
                                                               color: Colors.grey.shade700
                                                           ),
                                                         ),
                                                         SizedBox(
                                                           height: 20.0,
                                                           child: VerticalDivider(
                                                             color: Colors.white,
                                                           ),
                                                         ),
                                                         Text('6 Hours',
                                                           style: TextStyle(
                                                               color: Colors.grey.shade700
                                                           ),
                                                         )
                                                       ],
                                                     )
                                                   ],
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 40.0,
                                                 child: VerticalDivider(
                                                   color: Colors.white,
                                                 ),
                                               ),
                                               Image.asset('images/award.png', width: 20.0,),
                                               SizedBox(
                                                 width: 10.0,
                                               )
                                             ],
                                           ),
                                         ),
                                         width: double.infinity,
                                         decoration: BoxDecoration(
                                             color: Colors.white,
                                             borderRadius: BorderRadius.circular(16.0),
                                             boxShadow: [
                                               BoxShadow(
                                                   color: Color(0xFF1D1617).withOpacity(0.07),
                                                   blurRadius: 40.0,
                                                   spreadRadius: 0
                                               )
                                             ]
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                               );
                            }, separatorBuilder: ( context,  index) => SizedBox(
                              height: 20.0,
                            ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
        replacement: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}




