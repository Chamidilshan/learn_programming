import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF35323d),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Image.asset('images/stpge.png',
          ),
          const SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
              onPressed: () {},
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
                'Get Started Learning'
              ),
          )
        ],
      ),
    );
  }
}
