import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';

class NavigationRailLayout extends StatelessWidget {
  final bool isWide;
  final int currentIndex;
  final Function(int) onDestinationSelected;
  final List<(IconData, String)> navItems;
  const NavigationRailLayout({
    super.key,
    required this.isWide,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: isWide,
      indicatorColor: Colors.white,
      backgroundColor: MyColors.primary,
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
      unselectedLabelTextStyle: MyTextStyles.font15RegularGrey.copyWith(
        color: Colors.grey.shade400,
      ),
      selectedLabelTextStyle: MyTextStyles.font15RegularGrey.copyWith(
        fontSize: 17,
        color: Colors.white,
      ),
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: isWide
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      destinations: navItems.asMap().entries.map((entry) {
        final index = entry.key;
        final (iconData, label) = entry.value;
        return NavigationRailDestination(
          icon: Icon(iconData, size: currentIndex == index ? 20 : 30),
          label: Text(label),
        );
      }).toList(),
    );
  }
}
