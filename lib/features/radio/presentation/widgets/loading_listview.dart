import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListView extends StatelessWidget {
  const LoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: const LoadingWidget(height: 60),
        );
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const LoadingWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        height: height ?? 60,
        width: width ?? double.infinity,
      ),
    );
  }
}
