import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';

class AudioPlayerPage extends StatefulWidget {
  final String audioURL;

  const AudioPlayerPage({super.key, required this.audioURL});

  @override
  AudioPlayerPageState createState() => AudioPlayerPageState();
}

class AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else if (event == PlayerState.stopped) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWrapper(
            radius: 30.0,
            child: CircleAvatar(
              radius: 30.0,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50.0,
              ),
            ),
            onTap: () {
              if (isPlaying) {
                _audioPlayer.pause();
              } else {
                _audioPlayer.play(UrlSource(widget.audioURL));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.release();
    super.dispose();
  }
}
