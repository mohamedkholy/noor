import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/logic/language_cubit.dart';
import 'package:noor/core/notifications/notifications_manager.dart';
import 'package:noor/core/routing/app_router.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<NotificationsManager>().init();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<LanguageCubit>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<LanguageCubit>().getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String?>(
      builder: (context, state) {
        final locale = Locale(
          state ?? PlatformDispatcher.instance.locale.languageCode,
        );
        HijriCalendar.setLocal(locale.languageCode);
        return MaterialApp(
          locale: locale,
          navigatorKey: getIt<NotificationsManager>().navigatorKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
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
            fontFamily: "Cairo",
            appBarTheme: const AppBarTheme(color: MyColors.primary),
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
