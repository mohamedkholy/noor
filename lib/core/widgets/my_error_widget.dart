import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String error;
  final Function() onRetry;
  const MyErrorWidget({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, size: 40, color: Colors.red),
          const SizedBox(height: 10),
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: onRetry,
            icon: Icon(
              Icons.refresh,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
