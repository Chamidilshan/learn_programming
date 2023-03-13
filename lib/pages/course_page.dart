import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_programming/models/languages_card_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


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
      backgroundColor: const Color(0xFFF6F9FF),
      body: Visibility(
        visible: isLoaded,
        child: SafeArea(
          child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
              stream: courses,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError){
                  return Container(child: Center(child: Text('Something went wrong')));
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(child: Center(child: CircularProgressIndicator( color: Color(0xFFF6F9FF),)));
                }

                final data = snapshot.requireData;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 28.0, right: 28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/edited.png', width: 350.0,),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFDD807),
                                // color: Colors.pink,
                                borderRadius: BorderRadius.circular(40.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.languageCard.name} Proramming Languague',
                                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('${widget.languageCard.description}',
                                    style: TextStyle(
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 540.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)
                          )
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Explore Courses',
                             style: TextStyle(
                                 fontSize: 20.0,
                                 fontWeight: FontWeight.w900
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
                                                   SizedBox(height: 10.0),
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
                                         width: double.infinity,
                                         height: 70.0,
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
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h-100);
    path.quadraticBezierTo(w*0.5, h ,w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }}


