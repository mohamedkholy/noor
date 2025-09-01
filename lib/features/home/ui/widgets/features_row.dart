import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/generated/l10n.dart';

class FeaturesRow extends StatefulWidget {
  const FeaturesRow({super.key});

  @override
  State<FeaturesRow> createState() => _FeaturesRowState();
}

class _FeaturesRowState extends State<FeaturesRow> {
  late final HomeCubit homeCubit = context.read();
  late List<(String, IconData, Null Function())> features;

  @override
  Widget build(BuildContext context) {
    _initFeatures();
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

  void _initFeatures() {
    features = [
      (
        S.of(context).quran,
        const IconData(0xe821, fontFamily: "Quran"),
        () {
          Navigator.pushNamed(context, MyRoutes.quran).then((value) {
            homeCubit.getLasReading();
          });
        },
      ),
      (
        S.of(context).hadith,
        FontAwesomeIcons.book,
        () {
          Navigator.pushNamed(context, MyRoutes.hadith);
        },
      ),
      (
        S.of(context).tasbih,
        const IconData(0xe81f, fontFamily: "Tasbih"),
        () {
          Navigator.pushNamed(context, MyRoutes.tasbih);
        },
      ),
      (
        S.of(context).azkar,
        const IconData(0xe820, fontFamily: "Dua"),
        () {
          Navigator.pushNamed(context, MyRoutes.azkar);
        },
      ),
      (
        S.of(context).qibla,
        FontAwesomeIcons.compass,
        () {
          Navigator.pushNamed(context, MyRoutes.qibla);
        },
      ),
      (
        S.of(context).near_mosque,
        Icons.mosque,
        () {
          Navigator.pushNamed(context, MyRoutes.nearMosque);
        },
      ),
      (
        S.of(context).calendar,
        FontAwesomeIcons.calendarDays,
        () {
          Navigator.pushNamed(context, MyRoutes.calender);
        },
      ),
    ];
  }
}
