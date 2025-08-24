import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/helpers/font_weight_helper.dart'
    show FontWeightHelper;
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';

class ChapterWidget extends StatelessWidget {
  final Verse verse;
  const ChapterWidget({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.reading,
          arguments: {
            'surahNumber': verse.surahNumber,
            'ayaNumber': verse.number,
          },
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
                "${verse.juz}",
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    verse.textAr.replaceAll("۞", ""),
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "KFGQPC_Uthmanic",
                    ),
                  ),
                ),
                Text(
                  " ${verse.surahName} - Ayah ${verse.number}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Text(
            "${verse.page}",
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
