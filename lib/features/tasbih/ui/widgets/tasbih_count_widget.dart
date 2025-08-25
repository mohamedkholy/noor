import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TasbihCountWidget extends StatelessWidget {
  const TasbihCountWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFA7BCAE),
      ),
      child: AutoSizeText(
        maxLines: 1,
        textAlign: TextAlign.center,
        count.toString().padLeft(4, "0"),
        style: const TextStyle(
          fontSize: 90,
          height: 1,
          color: Colors.black,
          fontFamily: "DS-DIGI",
        ),
      ),
    );
  }
}
