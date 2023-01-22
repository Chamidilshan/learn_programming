import 'package:flutter/material.dart';
import 'package:learn_programming/pages/home_page.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF35323d),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 80.0,
          ),
          Image.asset('images/stpge.png',
          ),
          const SizedBox(
            height: 60.0,
          ),
          const Text(
            'Explore courses\nMaster your skills',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Coding skills can help you on your \nway to a '
                  'successful career path.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: 200.0,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => HomePage()
                  ),
                  );
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFffd80b),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                )
              ),
                child: const Text(
                  'Start Learning Today'
                ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
