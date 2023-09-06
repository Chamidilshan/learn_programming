import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:hidable/hidable.dart';
import 'dart:math';


class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<VideoData> videos = [];
  List<VideoData> randomVideos = [];

  @override
  void initState() {
    super.initState();
    fetchVideosFromFirebase();
  }

  Future<void> fetchVideosFromFirebase() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('videos').get();

    setState(() {
      videos = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return VideoData(
          link: data['link'] as String,
          description: data['description'] as String,
        );
      }).toList();
      videos.shuffle(Random());
      randomVideos = videos.take(2).toList();  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF373451),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'Tap to Learn: Exciting Programming Videos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
              ),
              VideoList(videos: randomVideos),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoData {
  final String link;
  final String description;

  VideoData({
    required this.link,
    required this.description,
  });
}

class VideoList extends StatelessWidget {
  final List<VideoData> videos;

  const VideoList({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: scrollController,
      shrinkWrap: true,
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            height: 320.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(videos[index].link) ?? '',
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(videos[index].description),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}