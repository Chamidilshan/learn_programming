import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  late Stream<QuerySnapshot> articles;
  bool isLoaded = false;

  @override
  void initState(){
    super.initState();
    articles = FirebaseFirestore.instance.collection('articles').snapshots();

    if(articles!=null){
      setState(() {
        isLoaded = true;
      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF373451),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: articles,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return Container(child: Center(child: Text('Unable'),));
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Container(
                  child: CircularProgressIndicator(color: Colors.yellowAccent,),
                );
              }
              final data = snapshot.requireData;

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Articles',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'Explore and read newly published articles to '
                        'get more knowledge and new information',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
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
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              data.docs[index]['name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                fontSize: 18.0
                                              )
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Image.network(
                                              data.docs[index]['imgLink'],
                                            width: double.infinity,
                                            height: 160.0,
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                              data.docs[index]['desc'],
                                            style: TextStyle(
                                              fontSize: 16.0
                                            ),
                                          ),
                                        ],
                                      )
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
              );
            },
          ),
        ),
      ),
    );
  }
}
