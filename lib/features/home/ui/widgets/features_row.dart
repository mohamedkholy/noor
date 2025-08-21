import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:noor/core/theming/my_colors.dart';

class FeaturesRow extends StatelessWidget {
  const FeaturesRow({super.key});
  final features = const [
    ("Quran", IconData(0xe821, fontFamily: "Quran")),
    ("Hadith", FontAwesomeIcons.book),
    ("Tasbih", IconData(0xe81f, fontFamily: "Tasbih")),
    ("Azkar", FontAwesomeIcons.handsPraying),
    ("Qibla", FontAwesomeIcons.compass),
    ("Near mosque", Icons.mosque),
    ("Calendar", FontAwesomeIcons.calendarDays),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          features.length,
          (index) => Container(
            width: 65,
            margin: EdgeInsetsDirectional.only(
              start: index == 0 ? 15 : 7,
              end: index == features.length - 1 ? 15 : 7,
              bottom: 10,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: MyColors.primary.withAlpha(50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    features[index].$2,
                    color: MyColors.primary,
                    size: 28,
                  ),
                ),
                SizedBox(height: 5),
                features[index].$1.length > 8
                    ? SizedBox(
                        height: 20,
                        child: Marquee(
                          blankSpace: 10,
                          pauseAfterRound: Duration(seconds: 2),
                          text: features[index].$1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Text(
                        textAlign: TextAlign.center,
                        features[index].$1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
