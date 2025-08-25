import 'package:flutter/material.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/routing/app_router.dart';
import 'package:noor/core/theming/my_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().getRoutes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(
              context,
            ).textScaler.clamp(minScaleFactor: 1, maxScaleFactor: 1),
          ),
          child: child!,
        );
      },
      theme: ThemeData(
        dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        fontFamily: "PlusJakartaSans",
        appBarTheme: const AppBarTheme(color: MyColors.primary),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
