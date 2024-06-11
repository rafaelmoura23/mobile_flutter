import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../models/music_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;
  const MusicPlayerScreen({super.key, required this.music});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audio;

  @override
  void initState() {
    super.initState();
    _audio = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await _audio.play(widget.music.url as Source);
          },
          child: const Text("Play"),
        ),
      ),
    );
  }
}
