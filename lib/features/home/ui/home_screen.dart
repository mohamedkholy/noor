import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/ui/widgets/ayah_of_the_day_widget.dart';
import 'package:noor/features/home/ui/widgets/date_location_widget.dart';
import 'package:noor/features/home/ui/widgets/features_row.dart';
import 'package:noor/features/home/ui/widgets/hadith_of_the_day.dart';
import 'package:noor/features/home/ui/widgets/last_read_widget.dart';
import 'package:noor/features/home/ui/widgets/next_prayer_count_down.dart';
import 'package:noor/features/home/ui/widgets/notifications_button.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit = context.read();
  late final NavigationCubit _navigationCubit = context.read();

  @override
  void initState() {
    _homeCubit.getTodayContent();
    _navigationCubit.getNotificationsState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 60,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              title: const DateLocationWidget(),
              actions: [
                const NotificatiosButton(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.settings).then((
                      value,
                    ) {
                      _navigationCubit.scheduleNotifications();
                    });
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                color: MyColors.primary,
                child: Column(
                  children: [
                    const NextPrayerCountDown(),
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
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
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
      ),
    );
  }
}
