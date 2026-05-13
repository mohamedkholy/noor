import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const SectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedContainer(
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(10),
        color: MyColors.primary,
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            AutoSizeText(
              title,
              style: const TextStyle(fontSize: 25, color: Colors.white),
              maxLines: 1,
            ),
            const SizedBox(height: 12),
            AutoSizeText(
              value.toString(),
              style: const TextStyle(fontSize: 25, color: Colors.white),
              maxLines: 1,
            ),
            const SizedBox(height: 12),
            Image.asset(icon, width: 60, height: 60),
          ],
        ),
      ),
    );
  }
}
