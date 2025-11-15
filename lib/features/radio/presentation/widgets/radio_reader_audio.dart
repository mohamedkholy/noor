import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';
import 'package:noor/features/radio/data/model/radio_data.dart';
import 'package:noor/features/radio/presentation/widgets/svg_icon.dart';

class RadioReaderAudio extends StatefulWidget {
  final RadioData radioData;
  final Function(RadioData) onRadioChangeRight;
  final Function(RadioData) onRadioChangeLeft;
  final List<RadioData> radioList;
  const RadioReaderAudio({
    super.key,
    required this.radioData,
    required this.radioList,
    required this.onRadioChangeRight,
    required this.onRadioChangeLeft,
  });

  @override
  State<RadioReaderAudio> createState() => _RadioReaderAudioState();
}

class _RadioReaderAudioState extends State<RadioReaderAudio> {
  late final AudioPlayer audioPlayer = context.read<NavigationCubit>().audioPlayer;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  double volume = 1.0;
  StreamSubscription? durationSub;
  StreamSubscription? positionSub;
  StreamSubscription? completeSub;
  @override
  void initState() {
    super.initState();
    context.read<NavigationCubit>().track = widget.radioData;
    togglePlayPause(widget.radioData.url!, false);

    durationSub = audioPlayer.durationStream.listen((d) {
      if (!mounted) return;
      setState(() => duration = d ?? Duration.zero);
    });

    positionSub = audioPlayer.positionStream.listen((p) {
      if (!mounted) return;
      setState(() => position = p);
    });

    completeSub = audioPlayer.playerStateStream.listen((event) {
      if(event.processingState == ProcessingState.ready){
        setState(() {
          isPlaying = true;
        });
      }
      if (event.processingState == ProcessingState.completed) {
        setState(() {
          isPlaying = false;
          position = Duration.zero;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant RadioReaderAudio oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.radioData.url != widget.radioData.url) {
      togglePlayPause(widget.radioData.url!, true);
    }
  }

  @override
  void dispose() {
    durationSub?.cancel();
    positionSub?.cancel();
    completeSub?.cancel();
    super.dispose();
  }

  Future<void> togglePlayPause(String audioUrl, bool choseInteral) async {
    try {
      if (choseInteral) {
        await audioPlayer.setUrl(audioUrl);
        await audioPlayer.play();
        setState(() {
          isPlaying = true;
        });
      } else {
        if (isPlaying) {
          await audioPlayer.pause();
          setState(() => isPlaying = false);
        } else {
          await audioPlayer.setUrl(audioUrl);
          await audioPlayer.play();
          setState(() => isPlaying = true);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void changeRadioRight(RadioData current) {
    final list = widget.radioList;
    final currentIndex = list.indexOf(current);
    if (currentIndex < list.length - 1) {
      widget.onRadioChangeRight(list[currentIndex + 1]);
    }
  }

  void changeRadioLeft(RadioData current) {
    final list = widget.radioList;
    final currentIndex = list.indexOf(current);
    if (currentIndex > 0) {
      widget.onRadioChangeLeft(list[currentIndex - 1]);
    }
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                changeRadioRight(widget.radioData);
              },
              child: Icon(Icons.skip_previous),
            ),
            SizedBox(width: 24),
            InkWell(
              onTap: () {
                togglePlayPause(widget.radioData.url!, false);
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 24),
            InkWell(
              onTap: () {
                changeRadioLeft(widget.radioData);
              },
              child: Icon(Icons.skip_next),
            ),
          ],
        ),

        SizedBox(height: 20),

        // شريط الوقت
        // Slider(
        //   value: position.inSeconds.toDouble(),
        //   min: 0,
        //   max: 0,
        //   onChanged: (value) async {
        //     // final newPosition = Duration(seconds: value.toInt());
        //     // await audioPlayer.seek(newPosition);
        //   },
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(color: Colors.black, height: 5, thickness: 2),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(formatTime(position)), Text(formatTime(duration))],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volume_down, color: Colors.black),
            Slider(
              value: volume,
              min: 0,
              max: 1,
              onChanged: (value) {
                setState(() => volume = value);
                audioPlayer.setVolume(value);
              },
            ),
            Icon(Icons.volume_up, color: Colors.black),
          ],
        ),
      ],
    );
  }
}
