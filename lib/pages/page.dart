import 'package:flutter/material.dart';
import 'package:learn_programming/main.dart';

import '../models/course_model.dart';

class CMPage extends StatefulWidget {
  const CMPage({Key? key}) : super(key: key);

  @override
  State<CMPage> createState() => _CMPageState();
}

class _CMPageState extends State<CMPage> {
  late List<Course> courses = [];
  bool isLoaded = false;
  @override
  void initState(){
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    var response = await supabase
        .from('courses')
        .select()
        .eq('language', 'Python')
        .execute();
     final data = response.data as List<dynamic>;
    setState(() {
      courses = data.map((course) => Course.fromJson(course)).toList();
    });
    if(courses!=null){
       isLoaded = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfeebcd),
      appBar: AppBar(
        backgroundColor: Color(0XFFfeebcd),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFFfcac63),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'C',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'C is a general-purpose, high-level programming language that was '
                          'developed in the early 1970s by Dennis Ritchie at '
                          'Bell Labs. It is considered a "mid-level" '
                          'language, as it has features of both high-level and low-level languages.',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'Courses',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: isLoaded,
              child: ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  final course = courses[index];
                  return Card(
                    color: Color(0xFF124f50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(course.name),
                    ),
                  );
                },
              ),
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}