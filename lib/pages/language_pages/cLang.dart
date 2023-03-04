import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:learn_programming/main.dart';
import 'package:learn_programming/models/languages_card_model.dart';
import 'package:supabase/supabase.dart';
import 'package:learn_programming/models/course_model.dart';

class CPage extends StatefulWidget {

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  List? courses;
  @override
  void initState(){
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    var response = await supabase
        .from('courses')
        .select()
    .execute();
    // final data = response.data as List<dynamic>;
    // final courses = data.map((json) => Course.fromJson(json)).toList();
    setState(() {
      courses = response.data.toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
        child: courses != null
            ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.00,
                crossAxisSpacing: 6.00),
            physics: const BouncingScrollPhysics(),
            itemCount: courses?.length,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                        (courses![index]["name"]).toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 4,
                      right: 16,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.00),
                          border: Border.all(color: Colors.blue, width: 1)),
                      // child: CachedNetworkImage(
                      //   imageUrl: dashList![index]["dash_image"],
                      //   height: 118.00,
                      //   width: 118.00,
                      // ),
                    ),
                  ),
                ],
              );
            })
            : const Center(
          child: Text("No Data Found"),
        ),
      ),
    );
  }
}
