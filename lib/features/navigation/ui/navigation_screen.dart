import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/ui/azkar_screen.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/ui/home_screen.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';
import 'package:noor/features/navigation/logic/navigation_state.dart';
import 'package:noor/features/navigation/ui/widgets/bottom_nav_layout.dart';
import 'package:noor/features/navigation/ui/widgets/navigation_rail_layout.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/ui/quran_screen.dart';
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart';
import 'package:noor/features/tasbih/ui/tasbih_screen.dart';
import 'package:noor/generated/l10n.dart' show S;

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late final NavigationCubit _cubit = context.read();

  @override
  void initState() {
    _cubit.initAsync();
    super.initState();
  }

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<QuranCubit>(),
      child: const QuranScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<AzkarCubit>(),
      child: const AzkarScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<TasbihCubit>(),
      child: const TasbihScreen(),
    ),
  ];

  int _currentIndex = 0;

  late List<(IconData, String)> navItems;

  @override
  Widget build(BuildContext context) {
    _initNavItems();
    final isMediumWide = MediaQuery.sizeOf(context).width > 840;
    final isWide = MediaQuery.sizeOf(context).width > 1200;
    return BlocListener<NavigationCubit, NavigationState>(
      listenWhen: (previous, current) => current is NotificationNavigation,
      listener: (context, state) {
        if (state is NotificationNavigation) {
          Navigator.pushNamed(context, state.route, arguments: state.arguments);
        }
      },
      child: SafeArea(
        left: false,
        top: false,
        right: false,
        child: Scaffold(
          bottomNavigationBar: !isMediumWide
              ? BottomNavLayout(
                  isWide: isWide,
                  currentIndex: _currentIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  navItems: navItems,
                )
              : null,
          body: Row(
            children: [
              if (isMediumWide)
                NavigationRailLayout(
                  isWide: isWide,
                  currentIndex: _currentIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  navItems: navItems,
                ),
              Expanded(child: _pages[_currentIndex]),
            ],
          ),
        ),
      ),
    );
  }

  void _initNavItems() {
    navItems = [
      (Icons.home, S.of(context).home),
      (const IconData(0xe821, fontFamily: "Quran"), S.of(context).quran),
      (const IconData(0xe820, fontFamily: "Dua"), S.of(context).azkar),
      (const IconData(0xe81f, fontFamily: "Tasbih"), S.of(context).tasbih),
    ];
  }
}
