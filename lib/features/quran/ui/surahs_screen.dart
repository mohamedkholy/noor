import 'package:flutter/material.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/ui/widgets/surah_widget.dart';

class SurahsScreen extends StatefulWidget {
  final List<Surah> surahs;
  const SurahsScreen({super.key, required this.surahs});

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey.shade300),
      itemCount: widget.surahs.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            top: index == 0 ? 15 : 5,
            bottom: index == widget.surahs.length - 1 ? 15 : 5,
          ),
          child: SurahWidget(surah: widget.surahs[index]),
        );
      },
    );
  }
}
