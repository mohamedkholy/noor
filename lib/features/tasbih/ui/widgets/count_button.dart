import 'package:flutter/material.dart';

class CountButton extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  const CountButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  State<CountButton> createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        margin: const EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.grey.shade400,
              Colors.grey.shade500,
              Colors.grey.shade600,
            ],
            radius: 0.8,
          ),
          border: Border.all(color: Colors.black12, width: 2),
          boxShadow: _isPressed
              ? [
                  const BoxShadow(
                    blurRadius: 30,
                    offset: Offset(0, 6),
                    color: Colors.black45,
                  ),
                ]
              : [],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
