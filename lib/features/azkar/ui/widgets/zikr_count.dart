import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

class ZikrCount extends StatelessWidget {
  final double progress;
  final int count;
  final VoidCallback onTap;
  const ZikrCount({
    super.key,
    required this.progress,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.primary.withAlpha(50),
            ),
            child: CircularProgressIndicator(
              value: progress,
              color: MyColors.primary,
            ),
          ),
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
