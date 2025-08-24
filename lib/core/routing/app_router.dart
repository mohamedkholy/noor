import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/ui/azkar_category_screen.dart';
import 'package:noor/features/azkar/ui/azkar_screen.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/ui/home_screen.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/ui/quran_screen.dart';
import 'package:noor/features/quran/ui/reading_screen.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    final args = settings.arguments;
    print("====================args $args========================");

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
      default:
        return null;
    }
  }
}
