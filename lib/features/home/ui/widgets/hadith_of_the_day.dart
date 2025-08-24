import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';

class HadithOfTheDay extends StatelessWidget {
  const HadithOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets.assetsImagesPngPattern),
          fit: BoxFit.contain,
          opacity: .05,
        ),
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hadith of the Day",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "sahih al-bukhari,Book 1, Hadith 1",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 15),
          Text(
            "Narrated Umar bin Al-Khattab: I heard Allah's Messenger (ﷺ) saying, \"The reward of deeds depends upon the intentions and every person will get the reward according to what he has intended. So whoever emigrated for worldly benefits or for a woman to marry, his emigration was for what he emigrated for.\"",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
