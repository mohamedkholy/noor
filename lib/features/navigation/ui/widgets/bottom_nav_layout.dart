import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';

class BottomNavLayout extends StatelessWidget {
  final bool isWide;
  final int currentIndex;
  final Function(int) onDestinationSelected;
  final List<(IconData, String)> navItems;
  const BottomNavLayout({
    super.key,
    required this.isWide,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Color(0xFF328475),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GNav(
        mainAxisAlignment: MediaQuery.sizeOf(context).width < 600
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 35,
        duration: const Duration(milliseconds: 100),
        gap: 8,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        textStyle: MyTextStyles.font24Bold.copyWith(
          fontSize: 17,
          color: MyColors.primary,
        ),
        color: Colors.grey.shade400,
        activeColor: MyColors.primary,
        tabBackgroundColor: Colors.white,
        selectedIndex: currentIndex,
        onTabChange: onDestinationSelected,
        tabs: navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final (iconData, label) = entry.value;
          return GButton(
            iconSize: currentIndex == index ? 20 : 30,
            icon: iconData,
            text: label,
          );
        }).toList(),
      ),
    );
  }
}
