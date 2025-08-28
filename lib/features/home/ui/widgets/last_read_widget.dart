import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/data/models/last_reading.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/logic/home_state.dart';

class LastReadWidget extends StatefulWidget {
  const LastReadWidget({super.key});

  @override
  State<LastReadWidget> createState() => _LastReadWidgetState();
}

class _LastReadWidgetState extends State<LastReadWidget> {
  late final HomeCubit homeCubit = context.read();
  LastReadingData? lastReadingData;

  @override
  void initState() {
    lastReadingData = homeCubit.getLasReading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is LastReadingLoaded,
      builder: (context, state) {
        if (state is LastReadingLoaded) {
          lastReadingData = state.lastReading;
        }
        return lastReadingData != null
            ? IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
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
                          const Expanded(
                            child: Text(
                              "Last Read",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${lastReadingData!.suraNameEn} ${lastReadingData!.verse.surahName}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Aya ${lastReadingData!.verse.number}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.reading,
                                  arguments: {
                                    'surahNumber':
                                        lastReadingData!.verse.surahNumber,
                                    'ayaNumber': lastReadingData!.verse.number,
                                  },
                                ).then((value) {
                                  Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () {
                                      homeCubit.getLasReading();
                                    },
                                  );
                                });
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "Continue",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Image.asset(
                          Assets.assetsImagesPngKoran,
                          height: 130,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
