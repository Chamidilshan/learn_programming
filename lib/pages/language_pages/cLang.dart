import 'package:flutter/material.dart';

class CPage extends StatelessWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Container(
          child: Column(
            children: [
              Text('C'),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'C is a general-purpose, high-level programming language that was '
                    'developed in the early 1970s by Dennis Ritchie at '
                    'Bell Labs. It is considered a "mid-level" '
                    'language, as it has features of both high-level and low-level languages.'
              ),
              Text('C is widely used for system programming, including operating systems, '
                  'embedded systems, and device drivers, as well as for application '
                  'development in various fields such as video games, financial and '
                  'trading systems, simulation '
                  'and modeling, and scientific computing.'),
              Text('One of the main strengths of C is its ability to provide direct access '
                  'to memory and low-level system resources, making it a highly '
                  'efficient and powerful language. It also has a relatively '
                  'small and simple syntax, making it easy to learn and use.'),
            ],
          ),
        ),
        ],
      ),
    );
  }
}