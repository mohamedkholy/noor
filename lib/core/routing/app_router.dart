import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/ui/azkar_category_screen.dart';
import 'package:noor/features/azkar/ui/azkar_screen.dart';
import 'package:noor/features/calender/ui/calender_screen.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/hadith/logic/hadith_cubit.dart';
import 'package:noor/features/hadith/ui/hadith_list_screen.dart';
import 'package:noor/features/hadith/ui/hadith_screen.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/ui/home_screen.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart';
import 'package:noor/features/near_mosque/ui/near_mosque_screen.dart';
import 'package:noor/features/qibla/ui/qibla_screen.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/ui/quran_screen.dart';
import 'package:noor/features/quran/ui/reading_screen.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/tasbih_screen.dart';
import 'package:noor/features/tasbih/ui/zekr_screen.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MyRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case MyRoutes.reading:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: ReadingScreen(
              surahNumber: (args as Map<String, int>)['surahNumber']!,
              ayaNumber: args['ayaNumber'],
            ),
          ),
        );
      case MyRoutes.quran:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: const QuranScreen(),
          ),
        );
      case MyRoutes.azkar:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AzkarCubit>(),
            child: const AzkarScreen(),
          ),
        );
      case MyRoutes.azkarCategory:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AzkarCubit>(),
            child: AzkarCategoryScreen(category: args as String),
          ),
        );
      case MyRoutes.hadith:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HadithCubit>(),
            child: const HadithScreen(),
          ),
        );
      case MyRoutes.hadithList:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HadithCubit>(),
            child: HadithListScreen(type: args as Kitab),
          ),
        );
      case MyRoutes.tasbih:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<TasbihCubit>(),
            child: const TasbihScreen(),
          ),
        );
      case MyRoutes.zekr:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<TasbihCubit>(),
            child: ZekrScreen(tasbih: args as Tasbih),
          ),
        );
      case MyRoutes.qibla:
        return MaterialPageRoute(builder: (context) => const QiblaScreen());
      case MyRoutes.calender:
        return MaterialPageRoute(builder: (context) => const CalenderScreen());
      case MyRoutes.nearMosque:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<NearMosqueCubit>(),
            child: const NearMosqueScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
