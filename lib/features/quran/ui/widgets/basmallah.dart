import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';

class Basmallah extends StatefulWidget {
  const Basmallah({super.key});

  @override
  State<Basmallah> createState() => _BasmallahState();
}

class _BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: 50,
      Assets.assetsImagesPngBasmala,
      color: Colors.black,
    );
  }
}
