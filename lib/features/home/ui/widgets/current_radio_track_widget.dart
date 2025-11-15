import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';

class CurrentRadioTrackWidget extends StatefulWidget {
  const CurrentRadioTrackWidget({super.key});

  @override
  State<CurrentRadioTrackWidget> createState() =>
      _CurrentRadioTrackWidgetState();
}

class _CurrentRadioTrackWidgetState extends State<CurrentRadioTrackWidget> {
  bool isPlaying = true;
  late final NavigationCubit _navigationCubit = context.read();

  void _togglePlayPause() {
    if (isPlaying) {
      _navigationCubit.audioPlayer.pause();
    } else {
      _navigationCubit.audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              _navigationCubit.track.img ?? "",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.music_note,
                    size: 24,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              _navigationCubit.track.name ?? "",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          IconButton(
            onPressed: _togglePlayPause,
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            ),
            color: Colors.white,
            iconSize: 40,
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              _navigationCubit.audioPlayer.stop();
              _navigationCubit.isPlaying.value = false;
              _togglePlayPause();
            },
            icon: const Icon(Icons.close, color: Colors.white, size: 25),
          ),
        ],
      ),
    );
  }
}
