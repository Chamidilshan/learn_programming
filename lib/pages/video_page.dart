import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learn_programming/pages/home_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:hidable/hidable.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> videoURLs = [
    'https://www.youtube.com/watch?v=bJzb-RuUcMU',
    'https://www.youtube.com/watch?v=k9WqpQp8VSU',
     'https://www.youtube.com/watch?v=zOjov-2OZ0E&t=4494s',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 28.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 44.0),
                child: Text('Discover the world of Programming',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0,
                  ),
                ),
              ),
              VideoWidget(videoIDs: videoIDs)
            ],
          ),
        ),
      ) ,
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required this.videoIDs,
  }) : super(key: key);

  final List<String> videoIDs;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: scrollController,
      shrinkWrap: true,
      itemCount: videoIDs.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
            ),
            height: 320.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoIDs[index],
                      flags: YoutubePlayerFlags(
                        autoPlay: false
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('This simple tutorial will teach you how you can learn computer '
                      'programming and teach yourself code. Learning code is not that hard, '
                      'and its easier than it looks. Instead of taking coding classes, why not teach '
                      'yourself? Using this method you will learn html, css, '
                      'javascript, visual design & more.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// VideoWidget(videoIDs: videoIDs)

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 56]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}