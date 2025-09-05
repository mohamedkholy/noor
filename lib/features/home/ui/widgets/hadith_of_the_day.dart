import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/logic/home_state.dart';
import 'package:noor/generated/l10n.dart';

class HadithOfTheDay extends StatelessWidget {
  const HadithOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is TodayHadithLoaded,
      builder: (context, state) {
        if (state is TodayHadithLoaded) {
          return Container(
            width: double.infinity,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).hadith_of_the_day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  KitabExtension.getTranslatedNameFromStirng(state.hadith.kitab),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    state.hadith.arab,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Amiri",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textDirection: TextDirection.ltr,
                    state.hadith.terjemah,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          width: double.infinity,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(color: MyColors.primary),
          ),
        );
      },
    );
  }
}
