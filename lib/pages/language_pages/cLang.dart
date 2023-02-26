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
      body: SafeArea(
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
            SizedBox(
              height: 20.0,
            ),

            // SizedBox(
            //   height: 20.0,
            // ),
            // Text('C is widely used for system programming, including operating systems, '
            //     'embedded systems, and device drivers, as well as for application '
            //     'development in various fields such as video games, financial and '
            //     'trading systems, simulation '
            //     'and modeling, and scientific computing.'),
            // SizedBox(
            //   height: 20.0,
            // ),
            // Text('One of the main strengths of C is its ability to provide direct access '
            //     'to memory and low-level system resources, making it a highly '
            //     'efficient and powerful language. It also has a relatively '
            //     'small and simple syntax, making it easy to learn and use.'),
          ],
        ),
      ),
    );
  }
}
