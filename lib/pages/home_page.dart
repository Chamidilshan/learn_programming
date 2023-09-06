import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learn_programming/pages/video_page.dart';
import 'package:learn_programming/widgets/institutes_button.dart';
import 'package:learn_programming/widgets/language_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VideoPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xFF373451),
      // bottomNavigationBar: CustomNavBar(),
      body: Container(
        color: Color(0xFF373451),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 260.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF373451),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.0),
                        Text(
                          'Learn Programming',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Discover a new world of programming languages',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Find a language',
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Programming Languages',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6
                        ?.apply(color: Colors.white),
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
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Top Institutes',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6
                        ?.apply(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Institutes(),
            ],
          ),
        ),
      ),

    );
  }
}
