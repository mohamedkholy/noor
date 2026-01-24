import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/generated/l10n.dart';

class OnboardingNavigation extends StatelessWidget {
  final bool isFirstScreen;
  final bool isLastScreen;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;
  final VoidCallback onComplete;

  const OnboardingNavigation({
    super.key,
    required this.isFirstScreen,
    required this.isLastScreen,
    required this.onNext,
    required this.onPrevious,
    required this.onSkip,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main navigation buttons
        Row(
          children: [
            // Previous button (hidden on first screen)
            if (!isFirstScreen)
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 8),
                  child: OutlinedButton(
                    onPressed: onPrevious,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      S.of(context).previous,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: isFirstScreen ? 0 : 8),
                child: ElevatedButton(
                  onPressed: isLastScreen ? onComplete : onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    isLastScreen
                        ? S.of(context).getStarted
                        : S.of(context).next,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (!isLastScreen)
          TextButton(
            onPressed: onSkip,
            child: Text(
              S.of(context).skip,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
