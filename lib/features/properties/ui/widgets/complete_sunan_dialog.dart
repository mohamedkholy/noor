import 'package:flutter/material.dart';

class CompleteSunanDialog extends StatelessWidget {
  const CompleteSunanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sunan'),
      content: const Text(
        'You have completed all sunan',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}