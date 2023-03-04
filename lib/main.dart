import 'package:flutter/material.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:learn_programming/pages/language_pages/cLang.dart';
import 'package:learn_programming/widgets/language_button.dart';
import 'pages/started_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://roecbtdjbxtdaefkyjet.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJvZWNidGRqYnh0ZGFlZmt5amV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc3Njg3ODYsImV4cCI6MTk5MzM0NDc4Nn0.AZOHPzx_hfUQMPeQZfkHWYvSg1pFoULYFY8qj1OiyDw',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
