import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';

class HeaderWidget extends StatelessWidget {
  final String surahName;
  const HeaderWidget({super.key, required this.surahName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesPngHeader,
            width: MediaQuery.of(context).size.width,
            height: 50,
          ),
          RichText(
            text: TextSpan(
              text: surahName,
              style: const TextStyle(
                color: Colors.black,
                height: 1,
                fontSize: 25,
                fontFamily: "KFGQPC_Uthmanic",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
