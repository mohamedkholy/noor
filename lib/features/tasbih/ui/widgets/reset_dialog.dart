import 'package:flutter/material.dart';

class ResetDialog extends StatelessWidget {
  final VoidCallback onResetPress;

  const ResetDialog({super.key, required this.onResetPress});

  @override
  Widget build(BuildContext context) {
    

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        textAlign: TextAlign.center,
        'Reset Tasbih',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      content: const Text(
        'Are you sure you want to reset the count? This action cannot be undone.',
        style: TextStyle(fontSize: 16, height: 1.4),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
          child: const Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            onResetPress();
          },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            'Reset',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
