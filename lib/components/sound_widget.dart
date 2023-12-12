import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SoundWidget extends StatefulWidget {
  final String name;
  final int length;
  final int id;
  const SoundWidget(
      {super.key, required this.name, required this.length, required this.id});

  @override
  State<SoundWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SoundWidget> {
  late AssetsAudioPlayer assetsAudioPlayer;
  bool playing = false;

  triggerSoundAudio() {
    assetsAudioPlayer.playlistFinished.listen((event) {
      if (event) {
        setState(() {
          playing = false;
        });
      }
    });
  }

  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.withId(widget.id.toString());
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio("assets/audios/${widget.name}.mp3"),
      ]),
      autoStart: false,
    );

    triggerSoundAudio();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.deepPurple[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: ListTile(
            title: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: playing
                  ? const Icon(
                      Icons.pause,
                      color: Colors.white,
                    )
                  : const Icon(Icons.play_arrow, color: Colors.white),
              onPressed: () {
                if (assetsAudioPlayer.isPlaying.value) {
                  assetsAudioPlayer.pause();
                } else {
                  for (var i = 0; i < widget.length; i++) {
                    var closedAudios = AssetsAudioPlayer.withId(i.toString());
                    if (closedAudios.isPlaying.value) {
                      closedAudios.stop();
                    }
                  }
                  assetsAudioPlayer.play();
                }
                setState(() {
                  playing = !playing;
                });
              },
            )),
      ),
    );
  }

  // AudioWidget.assets(
  //   path: "assets/audios/birds.mp3",
  //   play: _play,
  //   child: ElevatedButton(
  //       child: Text(
  //         _play ? "pause" : "play",
  //       ),
  //       onPressed: () {
  //         setState(() {
  //           _play = !_play;
  //         });
  //       }),
  //   onReadyToPlay: (duration) {
  //     //onReadyToPlay
  //   },
  //   onPositionChanged: (current, duration) {
  //     //onPositionChanged
  //   },
  // )
  //],

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }
}
