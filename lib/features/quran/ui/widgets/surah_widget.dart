import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';

import '../../../../generated/l10n.dart';

class SurahWidget extends StatelessWidget {
  final Surah surah;
  const SurahWidget({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.reading,
          arguments: {'surahNumber': surah.number},
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesSvgAyaShape,
                height: 50,
                colorFilter: ColorFilter.mode(
                  MyColors.primary.withAlpha(200),
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "${surah.number}",
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: surah.nameTransliteration,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    height: 1.0,
                  ),
                  children: [
                    TextSpan(
                      text: " ${surah.nameAr}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "KFGQPC_Uthmanic",
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                " ${Localizations.localeOf(context).languageCode == "ar" ? surah.revelationPlaceAr : surah.revelationPlaceEn} - ${surah.versesCount} ${S.current.aya} ",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "${surah.pageNumber}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ],
      ),
    );
  }
}
