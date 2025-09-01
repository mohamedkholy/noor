import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final double fontSize;

  const MyAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.fontSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: const EdgeInsetsDirectional.only(end: 15),
      title: Text(
        title,
        style: MyTextStyles.appBarTextStyle.copyWith(fontSize: fontSize),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: ModalRoute.of(context)?.canPop == true
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
