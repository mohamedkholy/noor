import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/core/widgets/decorated_container.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SectionWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext buildcontext) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedContainer(
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(10),
      color: MyColors.primary,
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            title,
            style: MyTextStyles.fontAmiriBold.copyWith(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Icon(icon, color: Colors.white, size: 60),
        ],
      ),
    ),
    );
  }
}
