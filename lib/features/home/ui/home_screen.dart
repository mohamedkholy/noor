import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/ui/widgets/ayah_of_the_day_widget.dart';
import 'package:noor/features/home/ui/widgets/date_location_widget.dart';
import 'package:noor/features/home/ui/widgets/features_row.dart';
import 'package:noor/features/home/ui/widgets/hadith_of_the_day.dart';
import 'package:noor/features/home/ui/widgets/last_read_widget.dart';
import 'package:noor/features/home/ui/widgets/next_prayer_count_down.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  void initState() {
     context.read<HomeCubit>().askForPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Scaffold(
            backgroundColor: MyColors.primary,
            appBar: AppBar(
              toolbarHeight: 60,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              title: const DateLocationWidget(),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications, color: Colors.white),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const NextPrayerCountDown(),
                  ),
                  IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const FeaturesRow(),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Column(
                              children: [
                                LastReadWidget(),
                                AyahOfTheDayWidget(),
                                HadithOfTheDay(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
