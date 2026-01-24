import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/onboarding/data/models/onboarding_config.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferencesSettingsService _sharedPreferencesService;

  OnboardingCubit(this._sharedPreferencesService)
    : super(const OnboardingState());

  void nextScreen() {
    if (state.currentScreenIndex < OnboardingConfig.screens.length - 1) {
      emit(OnboardingState(currentScreenIndex: state.currentScreenIndex + 1));
    }
  }

  void previousScreen() {
    if (state.currentScreenIndex > 0) {
      emit(OnboardingState(currentScreenIndex: state.currentScreenIndex - 1));
    }
  }

  OnboardingScreen get currentScreen =>
      OnboardingConfig.screens[state.currentScreenIndex];

  int get totalScreens => OnboardingConfig.screens.length;

  bool get isFirstScreen => state.currentScreenIndex == 0;

  bool get isLastScreen =>
      state.currentScreenIndex == OnboardingConfig.screens.length - 1;

  double get progress =>
      (state.currentScreenIndex + 1) / OnboardingConfig.screens.length;

  void completeOnboardingAndNavigate(BuildContext context) async {
    await _sharedPreferencesService.setOnboardingCompleted();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, MyRoutes.navigation);
    }
  }

  void skipOnboardingAndNavigate(BuildContext context) {
    _sharedPreferencesService.setOnboardingCompleted();
    Navigator.pushReplacementNamed(context, MyRoutes.navigation);
  }
}

class OnboardingState {
  final int currentScreenIndex;
  final bool isCompleted;

  const OnboardingState({
    this.currentScreenIndex = 0,
    this.isCompleted = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingState &&
          runtimeType == other.runtimeType &&
          currentScreenIndex == other.currentScreenIndex &&
          isCompleted == other.isCompleted;

  @override
  int get hashCode => currentScreenIndex.hashCode ^ isCompleted.hashCode;
}
