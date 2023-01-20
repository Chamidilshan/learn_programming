import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF35323d),
      body: Column(
        children: <Widget>[
          Image.asset('images/stpge.png',
          ),
          SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                'Get Started Learning'
              ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFffd80b),
              foregroundColor: Colors.black,
              elevation: 0,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              )
            ),
          )
        ],
      ),
    );
  }
}
