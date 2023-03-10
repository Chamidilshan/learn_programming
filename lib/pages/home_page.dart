import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learn_programming/widgets/institutes_button.dart';
import 'package:learn_programming/widgets/language_button.dart';
import 'package:learn_programming/models/institutes_card_model.dart';
import 'package:learn_programming/pages/language_pages/cLang.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(backgroundColor:  Color(0xFFF6F9FF),),
      backgroundColor: Color(0xFFF6F9FF),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Color(0xFFffca9e), Color(0xFFfdf3e7) ]
        //   )
        // ),
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            Animate(
              child: Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                height: 180.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Color(0xFF35323d),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'Select a programming\nlanguage and explore courses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Find a languague',
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.grey
                        ),
                      ),
                    )
                  ],
                ),
              ).animate().fade(duration: 600.ms),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Text(
                  'Programming Languages',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            Languages(),
            SizedBox(
              height: 20.0,
            ),
            // Row(
            //   children: [
            //     Text(
            //       'Institutes With Free Certifications',
            //       style: Theme.of(context).textTheme.headline6,
            //     )
            //   ],
            // ),
            SizedBox(
              height: 20.0,
            ),
            // Institutes(),
            // SizedBox(
            //   height: 20.0,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),
      ),
    );
  }
}
