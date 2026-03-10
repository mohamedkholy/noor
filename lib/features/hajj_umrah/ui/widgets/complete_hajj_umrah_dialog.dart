import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/generated/l10n.dart';

class CompleteHajjUmrahDialog extends StatefulWidget {
  const CompleteHajjUmrahDialog({super.key});

  @override
  State<CompleteHajjUmrahDialog> createState() =>
      _CompleteHajjUmrahDialogState();
}

class _CompleteHajjUmrahDialogState extends State<CompleteHajjUmrahDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;
  late ConfettiController _confettiController;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    scale = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 1),
    );
    _confettiController.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: .4,
              numberOfParticles: 20,
              gravity: .1,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Image.asset(
                Assets.assetsImagesPngKaaba,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                S.of(context).complete_hajj_umrah_message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
