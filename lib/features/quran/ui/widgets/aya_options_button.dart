import 'package:flutter/material.dart';

class AyaOptionsButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final Color iconColor;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final Color subtextColor;
  final VoidCallback onTap;

  const AyaOptionsButton({
    super.key,
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.iconColor,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.subtextColor,
    required this.onTap,
  });

  @override
  State<AyaOptionsButton> createState() => _AyaOptionsButtonState();
}

class _AyaOptionsButtonState extends State<AyaOptionsButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          decoration: BoxDecoration(
            color: _pressed ? widget.bgColor.withOpacity(0.8) : widget.bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: widget.borderColor, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, color: widget.iconColor, size: 28),
              const SizedBox(height: 10),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.textColor,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                widget.sublabel,
                style: TextStyle(
                  fontSize: 12,
                  color: widget.subtextColor,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
