import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> videoURLs = [
    'https://www.youtube.com/watch?v=bJzb-RuUcMU',
    'https://www.youtube.com/watch?v=k9WqpQp8VSU',
    // 'https://www.youtube.com/watch?v=zOjov-2OZ0E&t=4494s',
    // 'https://www.youtube.com/watch?v=79pKwdiqcwI',
    // 'https://www.youtube.com/watch?v=Mj3QejzYZ70'
  ];
  List<String> videoIDs = [];

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  late YoutubePlayerController _controller;

  @override
  void initState(){
    videoIDs = List.generate(videoURLs.length, (index) => '');
    for(int i = 0; i< videoURLs.length; i++){
      videoIDs[i] = YoutubePlayer.convertUrlToId(videoURLs[i])!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF373451),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F9FF),
        title: Text(
            'Motivation to programming',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(6.0),
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
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
            duration: Duration(milliseconds: 1000),
            ),
      ),
      body: ListView.builder(
        itemCount: videoIDs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoIDs[index],
                    flags: YoutubePlayerFlags(
                      autoPlay: false
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
