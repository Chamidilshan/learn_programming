import 'package:flutter/material.dart';
import 'package:learn_programming/models/languages_card_model.dart';
import 'package:supabase/supabase.dart';

class CPage extends StatefulWidget {

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {

  @override
  void initState(){
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async{
    final response = await supabase.from('courses').select().eq('java', language).execute();

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
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color(0xFF124f50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(),
                    height: 60,
                    child: const Center(child: Text('Course Name')),
                  ),
                );
              },
              itemCount: 10,
            )
          ],
        ),
      ),
    );
  }
}
