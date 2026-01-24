import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

class OnboardingProgress extends StatelessWidget {
  final int currentScreen;
  final int totalScreens;
  final double progress;

  const OnboardingProgress({
    super.key,
    required this.currentScreen,
    required this.totalScreens,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress bar
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Screen indicator
        Text(
          '$currentScreen / $totalScreens',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
