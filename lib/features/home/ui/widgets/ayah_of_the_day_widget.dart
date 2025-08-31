import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/logic/home_state.dart';

class AyahOfTheDayWidget extends StatelessWidget {
  const AyahOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is TodayVerseLoaded,
      builder: (context, state) {
        if (state is TodayVerseLoaded) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Assets.assetsImagesPngWindow),
                fit: BoxFit.cover,
                opacity: .04,
              ),
              color: MyColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ayah of the Day",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Surah ${state.verse.surahName},Aya ${state.verse.number}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    state.verse.textAr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "KFGQPC_Uthmanic",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    state.verse.textEn,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
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
            child: CircularProgressIndicator(
              color: MyColors.primary,
            ),
          ),
        );
      },
    );
  }
}
