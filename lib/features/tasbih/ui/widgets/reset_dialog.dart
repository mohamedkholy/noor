import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ResetDialog extends StatelessWidget {
  final VoidCallback onResetPress;

  const ResetDialog({super.key, required this.onResetPress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        textAlign: TextAlign.center,
        S.current.reset_tasbih,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      content: Text(
        S.current.reset_confirmation,
        style: const TextStyle(fontSize: 16, height: 1.4),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
          child: Text(
            S.current.cancel,
            style: const TextStyle(fontWeight: FontWeight.w500),
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
          child: Text(
            S.current.reset,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
