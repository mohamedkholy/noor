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
      appBar: MyAppBar(
        title: widget.category,
        fontFamily: "Amiri",
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: BlocBuilder<AzkarCubit, AzkarState>(
            builder: (context, state) {
              if (state is AzkarLoaded) {
                azkarCount.addAll(
                  List.generate(state.azkar.length, (index) => 0),
                );
                return ListView.builder(
                  controller: pageController,
                  itemCount: state.azkar.length,
                  itemBuilder: (context, index) {
                    final azkar = state.azkar[index];
                    return ZikrWidget(
                      zekr: azkar,
                      count: azkarCount[index],
                      onCountChange: (count) {
                        azkarCount[index] = count;
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
}
