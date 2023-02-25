import 'package:flutter/material.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:learn_programming/pages/language_pages/cLang.dart';
import 'package:learn_programming/widgets/language_button.dart';
import 'pages/started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
