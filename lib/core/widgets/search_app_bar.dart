import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_text_styles.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(String) onSearch;
  final Function(bool)? onstartSearch;
  const SearchAppBar({
    super.key,
    required this.title,
    required this.onSearch,
    this.onstartSearch,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: !isSearching
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      centerTitle: true,
      title: !isSearching
          ? Text(widget.title, style: MyTextStyles.appBarTextStyle)
          : TextField(
              cursorColor: Colors.white,
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: widget.onSearch,
            ),
      actions: [
        IconButton(
          icon: Icon(
            isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isSearching = !isSearching;
              if (!isSearching) widget.onSearch("");
            });
            if (widget.onstartSearch != null) {
              widget.onstartSearch!(isSearching);
            }
          },
        ),
      ],
    );
  }
}
