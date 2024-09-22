import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/RadioStation.dart';

class RadioTabInfo extends StatefulWidget {
  Radios? radios;
  final Function next, back;
  AudioPlayer player;

  RadioTabInfo(
      {super.key,
      required this.player,
      required this.radios,
      required this.next,
      required this.back});

  @override
  State<RadioTabInfo> createState() => _RadioTabInfoState();
}

class _RadioTabInfoState extends State<RadioTabInfo> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          widget.radios?.name ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  widget.back();
                },
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                )),
            IconButton(
                onPressed: () async {
                  !isPlaying
                      ? await widget.player
                          .play(UrlSource(widget.radios?.url ?? ""))
                      : widget.player.pause();
                  isPlaying = !isPlaying;
                  setState(() {});
                },
                icon: !isPlaying
                    ? Icon(Icons.play_circle_outline)
                    : Icon(Icons.pause_circle_outline)),
            IconButton(
                onPressed: () {
                  widget.next();
                },
                icon: Icon(
                  Icons.next_plan_rounded,
                )),
          ],
        ),
      ],
    );
  }

// @override
// void dispose() {
//   widget.player.dispose();
//   super.dispose();
// }


}
