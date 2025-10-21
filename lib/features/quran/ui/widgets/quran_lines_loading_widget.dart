import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuranLinesLoadingWidget extends StatelessWidget {
  const QuranLinesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
