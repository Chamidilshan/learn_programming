import 'package:flutter/material.dart';
import 'package:learn_programming/pages/dashboard.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:learn_programming/pages/started_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Supabase.initialize(
  //   url: 'https://roecbtdjbxtdaefkyjet.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJvZWNidGRqYnh0ZGFlZmt5amV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc3Njg3ODYsImV4cCI6MTk5MzM0NDc4Nn0.AZOHPzx_hfUQMPeQZfkHWYvSg1pFoULYFY8qj1OiyDw',
  // );

  runApp( MyApp());
}
final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
