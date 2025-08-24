import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/logic/home_cubit.dart';

class FeaturesRow extends StatefulWidget {
  const FeaturesRow({super.key});

  @override
  State<FeaturesRow> createState() => _FeaturesRowState();
}

class _FeaturesRowState extends State<FeaturesRow> {
  late final HomeCubit homeCubit = context.read();
  late final features = [
    (
      "Quran",
      const IconData(0xe821, fontFamily: "Quran"),
      () {
        Navigator.pushNamed(context, MyRoutes.quran).then((value) {
          homeCubit.getLasReading();
        });
      },
    ),
    ("Hadith", FontAwesomeIcons.book, () {}),
    ("Tasbih", const IconData(0xe81f, fontFamily: "Tasbih"), () {}),
    (
      "Azkar",
      FontAwesomeIcons.handsPraying,
      () {
        Navigator.pushNamed(context, MyRoutes.azkar);
      },
    ),
    ("Qibla", FontAwesomeIcons.compass, () {}),
    ("Near mosque", Icons.mosque, () {}),
    ("Calendar", FontAwesomeIcons.calendarDays, () {}),
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
            child: GestureDetector(
              onTap: features[index].$3,
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
                  const SizedBox(height: 5),
                  features[index].$1.length > 8
                      ? SizedBox(
                          height: 20,
                          child: Marquee(
                            blankSpace: 10,
                            pauseAfterRound: const Duration(seconds: 2),
                            text: features[index].$1,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(
                          textAlign: TextAlign.center,
                          features[index].$1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
