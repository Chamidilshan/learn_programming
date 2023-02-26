import 'package:flutter/material.dart';

class CPage extends StatelessWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfeebcd),
      appBar: AppBar(
        backgroundColor: Color(0XFFfeebcd),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
