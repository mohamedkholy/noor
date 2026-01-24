import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/onboarding/logic/onboarding_cubit.dart';
import 'package:noor/features/onboarding/ui/widgets/onboarding_content.dart';
import 'package:noor/features/onboarding/ui/widgets/onboarding_navigation.dart';
import 'package:noor/features/onboarding/ui/widgets/onboarding_progress.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            if (state.isCompleted) {
              return const Center(
                child: Text(
                  'Onboarding Completed!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              );
            }

            final cubit = context.read<OnboardingCubit>();
            final currentScreen = cubit.currentScreen;

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        OnboardingProgress(
                          currentScreen: cubit.state.currentScreenIndex + 1,
                          totalScreens: cubit.totalScreens,
                          progress: cubit.progress,
                        ),
                        const SizedBox(height: 40),
                        OnboardingContent(screen: currentScreen),
                        const Spacer(),
                        OnboardingNavigation(
                          isFirstScreen: cubit.isFirstScreen,
                          isLastScreen: cubit.isLastScreen,
                          onNext: () => cubit.nextScreen(),
                          onPrevious: () => cubit.previousScreen(),
                          onSkip: () =>
                              cubit.skipOnboardingAndNavigate(context),
                          onComplete: () =>
                              cubit.completeOnboardingAndNavigate(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
