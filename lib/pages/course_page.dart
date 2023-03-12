import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Text('C Proramming Languague',
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Color(0xFF0050A6)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('C is a general-purpose, high-level programming language that was '
                          'developed in the early 1970s by Dennis Ritchie at '
                          'Bell Labs. It is considered a "mid-level" '
                          'language, as it has features of both high-level and low-level languages.',
                        style: TextStyle(
                          color: Colors.black87
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('C is a general-purpose, high-level programming language that was '
                          'developed in the early 1970s by Dennis Ritchie at '
                          'Bell Labs. It is considered a "mid-level" '
                          'language, as it has features of both high-level and low-level languages.',
                        style: TextStyle(
                            color: Colors.black87
                        ),
                      ),
                    ],
                  ),
                ),
                height: 240.0,
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
                    ListView.separated(physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,itemCount: 10,shrinkWrap: true, itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {print('Pressed');},
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 10.0),
                              Image.asset('images/code.png', width: 40.0,),
                              SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0),
                                  Text('Introduction to C Programming',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  )
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Udemy',
                                          style: TextStyle(
                                            color: Colors.grey.shade700
                                          ),
                                        ),
                                      SizedBox(
                                        width: 20.0,
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
                              SizedBox(
                                width: 60.0,
                              ),
                              Image.asset('images/award.png', width: 36.0,),
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
                      );
                    }, separatorBuilder: ( context,  index) => SizedBox(
                      height: 20.0,
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
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


