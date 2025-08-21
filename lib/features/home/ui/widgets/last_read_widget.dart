import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';

class LastReadWidget extends StatelessWidget {
  const LastReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesPngIslam),
            fit: BoxFit.contain,
            opacity: .04,
          ),
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Last Read",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Surah Al-Baqarah", style: TextStyle(color: Colors.white)),
                Text("Aya 28", style: TextStyle(color: Colors.white)),
                SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text("Continue", style: TextStyle(color: Colors.black)),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: Image.asset(Assets.assetsImagesPngKoran, height: 130),
            ),
          ],
        ),
      ),
    );
  }
}
