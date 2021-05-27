import 'package:body_mind/components/components.dart';
import 'package:body_mind/components/constants.dart';
import 'package:body_mind/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AgachamentoScreen extends StatefulWidget {
  @override
  _AgachamentoScreenState createState() => _AgachamentoScreenState();
}

class _AgachamentoScreenState extends State<AgachamentoScreen> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/yoga2.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
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
        title: Text('Agachamento'),
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: Text(
              'Descrição',
              style: kDescStyle,
            ),
          ),
          Expanded(
            child: Text(
              '3 Sessões de 15, a cada 15 sequências, descanse 1 minuto,',
              textAlign: TextAlign.center,
              style: kFullDescStyle,
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    //_ControlsOverlay(controller: _controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  title: 'Finalizar',
                ),
              ))
        ],
      ),
    );
  }
}
