import 'package:body_mind/components/components.dart';
import 'package:body_mind/screens/exercises/abs_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/meditation.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clear Your Mind First'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Antes de começar o treinamento, primeiro relaxe'
                ' sua mente, com um leve exercíco de meditação',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    //_ControlsOverlay(controller: _controller),
                    //VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ABSScreen(),
                  ),
                );
              },
              title: 'NEXT',
            ),
          ],
        ),
      ),
    );
  }
}
