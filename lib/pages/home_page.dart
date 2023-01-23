import 'package:flutter/material.dart';
import 'package:learn_programming/widgets/institutes_button.dart';
import 'package:learn_programming/widgets/language_button.dart';
import 'package:learn_programming/models/institutes_card_model.dart';
import 'package:learn_programming/pages/language_pages/cLang.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          Container(
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
          ),
          SizedBox(
            height: 20.0,
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
            height: 20.0,
          ),
          Languages(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'Institutes With Free Certifications',
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Institutes(),
          SizedBox(
            height: 20.0,
          ),
         // Languages(),
          SizedBox(
            height: 20.0,
          ),
          //Languages(),
        ],
      ),
    );
  }
}
