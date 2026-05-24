import 'package:flutter/material.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/routing/my_routes.dart';

import '../../../../generated/l10n.dart';

class SearchResultItem extends StatelessWidget {
  final Verse verse;
  const SearchResultItem({super.key, required this.verse});

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
            'pageNumber': verse.page,
            'juzNumber': verse.juz,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${verse.surahName} - ${S.current.aya} ${verse.number}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    verse.textAr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'KFGQPC_Uthmanic',
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${verse.page}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeightHelper.medium,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
