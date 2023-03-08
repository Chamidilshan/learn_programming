import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Color(0xFFFedb92f),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('C Coureses',
                        style: TextStyle(color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Image.asset('images/assC.png', width: 120.0,)
                      ],
                    ),
                    // Image.asset('images/books.png', width: 80.0,),
                    Row(
                      children: [
                        SizedBox(
                          width: 50.0,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10.0),
                        //     color: Colors.white,
                        //   ),
                        //   child: Text('Most Popular'),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
              ),
            ),
            ClipRRect(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text('Explore Courses',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40.0),
              child: ListView.separated(itemCount: 10,shrinkWrap: true, itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {print('Pressed');},
                  child: Container(
                    child: Row(
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
            )
          ],
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
