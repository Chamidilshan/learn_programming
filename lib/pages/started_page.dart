import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:shimmer/shimmer.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF373451),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Image.asset('images/stpgenew.png',
            ),
          ),
          Column(
            children: const [
              Text(
                'Explore courses\nMaster your skills',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: 200.0,
              child: ElevatedButton(
                  onPressed: () {
                    Timer(
                        Duration(seconds: 1),
                            () => Navigator.pushReplacement(
                              context, MaterialPageRoute(
                                builder: (context) => const HomePage()
                            ),
                            )
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
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: const Text(
                      'Start Learning Today'
                    ),
                  ),
              ),
            ),
          ),],
      ),
    );
  }
}
