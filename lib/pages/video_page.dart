import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F9FF),
        title: Text(
            'Motivation to programming',
          style: TextStyle(
            color: Colors.black
          ),
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
