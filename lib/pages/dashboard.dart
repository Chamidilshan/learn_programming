import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learn_programming/pages/course_page.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:learn_programming/pages/video_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int _page = 0;

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      HomePage(),
      VideoPage(),
      HomePage(),
      VideoPage()
    ];

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        color: Color(0xFF373451),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: GNav(
          backgroundColor: Color(0xFF373451),
          gap: 4.0,
          activeColor: Colors.black,
          color: Colors.white,
          tabBackgroundColor: Colors.white,
          iconSize: 24.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: TextStyle(fontSize: 16.0),
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
              textStyle: TextStyle(fontSize: 16.0),
            ),
            GButton(icon: Icons.youtube_searched_for,
              text: 'Videos',
              textStyle: TextStyle(fontSize: 16.0),
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favourite',
              textStyle: TextStyle(fontSize: 16.0),
            ),
          ],
          selectedIndex: _page,
          onTabChange: updatePage,
        ),
      )
    );
  }
}
