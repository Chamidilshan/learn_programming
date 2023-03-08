import 'package:flutter/material.dart';
import 'package:learn_programming/models/languages_card_model.dart';
import 'package:learn_programming/pages/course_page.dart';
import 'package:learn_programming/pages/language_pages/cLang.dart';
import 'package:learn_programming/pages/page.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.0,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return SizedBox(
              width: 220.0,
              child: Card(
                color:  Color(0XFFfef2e4),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoursesPage(),
                        )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(languages[index].image,
                          height: 160.0,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              languages[index].name,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(right:10.0),
          ),
        itemCount: languages.length,
      ),
    );
  }
}
