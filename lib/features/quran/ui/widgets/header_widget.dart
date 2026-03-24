import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';

class HeaderWidget extends StatelessWidget {
  final int surahNumber;
  const HeaderWidget({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    final quranCubit = context.read<QuranCubit>();

    return ValueListenableBuilder<Color>(
      valueListenable: quranCubit.readingBackgroundColorNotifier,
      builder: (context, bgColor, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(Assets.assetsImagesPngMainframe),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: surahNumber.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    height: 1,
                    fontSize: 29,
                    fontFamily: "arsura",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
