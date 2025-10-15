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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Image.asset(
          Assets.assetsImagesPngBasmala,
          fit: BoxFit.cover,
          color: Colors.black,
        ),
      ),
    );
  }
}
