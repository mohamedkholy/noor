import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/logic/azkar_state.dart';
import 'package:noor/features/azkar/ui/widgets/zikr_widget.dart';

class AzkarCategoryScreen extends StatefulWidget {
  final String category;
  const AzkarCategoryScreen({super.key, required this.category});

  @override
  State<AzkarCategoryScreen> createState() => _AzkarCategoryScreenState();
}

class _AzkarCategoryScreenState extends State<AzkarCategoryScreen> {
  late final AzkarCubit azkarCubit = context.read();
  final PageController pageController = PageController();
  final List<int> azkarCount = [];
  final List<GlobalKey> azkarKeys = [];

  @override
  void initState() {
    super.initState();
    azkarCubit.getAzkar(widget.category);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.category),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: BlocBuilder<AzkarCubit, AzkarState>(
            builder: (context, state) {
              if (state is AzkarLoaded) {
                azkarCount.addAll(
                  List.generate(
                    state.azkar.length,
                    (index) =>
                        DateUtils.dateOnly(
                              DateTime.now(),
                            ).microsecondsSinceEpoch ==
                            state.azkar[index].todayDate
                        ? state.azkar[index].todayCount ?? 0
                        : 0,
                  ),
                );
                azkarKeys.addAll(
                  List.generate(state.azkar.length, (index) => GlobalKey()),
                );
                return ListView.builder(
                  controller: pageController,
                  itemCount: state.azkar.length,
                  itemBuilder: (context, index) {
                    final azkar = state.azkar[index];
                    return ZikrWidget(
                      key: azkarKeys[index],
                      zekr: azkar,
                      count: azkarCount[index],
                      onCountChange: (count) {
                        azkarCount[index] = count;
                        azkarCubit.updateTodayAzkarCount(
                          azkar.category,
                          azkar.zekr,
                          count,
                          todayDate: DateUtils.dateOnly(
                            DateTime.now(),
                          ).microsecondsSinceEpoch,
                        );
                        if (count == azkar.count &&
                            index < azkarKeys.length - 1) {
                          _scrollToZekr(azkarKeys[index + 1]);
                        }
                      },
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: MyColors.primary),
              );
            },
          ),
        ),
      ),
    );
  }

  void _scrollToZekr(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
