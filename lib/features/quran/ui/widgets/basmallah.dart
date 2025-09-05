import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';

class Basmallah extends StatefulWidget {
  final int index;
  const Basmallah({super.key, required this.index});

  @override
  State<Basmallah> createState() => _BasmallahState();
}

class _BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 200,
      Assets.assetsImagesPngBasmala,
      color: Colors.black,
    );
  }
}
