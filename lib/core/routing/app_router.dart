import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/ui/azkar_category_screen.dart';
import 'package:noor/features/azkar/ui/azkar_screen.dart';
import 'package:noor/features/calender/ui/calender_screen.dart';
import 'package:noor/features/calender/ui/logic/calender_cubit.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/hadith/logic/hadith_cubit.dart';
import 'package:noor/features/hadith/ui/hadith_list_screen.dart';
import 'package:noor/features/hadith/ui/hadith_screen.dart';
import 'package:noor/features/location/logic/location_cubit.dart';
import 'package:noor/features/location/ui/location_screen.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';
import 'package:noor/features/navigation/ui/navigation_screen.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart';
import 'package:noor/features/near_mosque/ui/near_mosque_screen.dart';
import 'package:noor/features/qibla/ui/qibla_screen.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/ui/quran_screen.dart';
import 'package:noor/features/quran/ui/reading_screen.dart';
import 'package:noor/features/settings/logic/settings_cubit.dart';
import 'package:noor/features/settings/ui/settings_screen.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/tasbih_screen.dart';
import 'package:noor/features/tasbih/ui/zekr_screen.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MyRoutes.navigation:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<NavigationCubit>(),
            child: const NavigationScreen(),
          ),
          settings,
        );
      case MyRoutes.reading:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: ReadingScreen(
              surahNumber: (args as Map<String, int>)['surahNumber']!,
              ayaNumber: args['ayaNumber'],
            ),
          ),
          settings,
        );
      case MyRoutes.quran:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: const QuranScreen(),
          ),
          settings,
        );
      case MyRoutes.azkar:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<AzkarCubit>(),
            child: const AzkarScreen(),
          ),
          settings,
        );
      case MyRoutes.azkarCategory:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<AzkarCubit>(),
            child: AzkarCategoryScreen(category: args as String),
          ),
          settings,
        );
      case MyRoutes.hadith:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<HadithCubit>(),
            child: const HadithScreen(),
          ),
          settings,
        );
      case MyRoutes.hadithList:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<HadithCubit>(),
            child: HadithListScreen(type: args as Kitab),
          ),
          settings,
        );
      case MyRoutes.tasbih:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<TasbihCubit>(),
            child: const TasbihScreen(),
          ),
          settings,
        );
      case MyRoutes.zekr:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<TasbihCubit>(),
            child: ZekrScreen(tasbih: args as Tasbih),
          ),
          settings,
        );
      case MyRoutes.qibla:
        return _createRoute(const QiblaScreen(), settings);
      case MyRoutes.calender:
        return _createRoute(
          BlocProvider(
            create: (context) => CalenderCubit(),
            child: const CalenderScreen(),
          ),
          settings,
        );
      case MyRoutes.nearMosque:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<NearMosqueCubit>(),
            child: const NearMosqueScreen(),
          ),
          settings,
        );
      case MyRoutes.location:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<LocationCubit>(),
            child: const LocationScreen(),
          ),
          settings,
        );
      case MyRoutes.settings:
        return _createRoute(
          BlocProvider(
            create: (context) => getIt<SettingsCubit>(),
            child: const SettingsScreen(),
          ),
          settings,
        );
      default:
        return null;
    }
  }

  static Route<dynamic> _createRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: _slideFromRight,
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }

  static Widget _slideFromRight(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

    final offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(curved);

    return SlideTransition(position: offsetAnimation, child: child);
  }
}
