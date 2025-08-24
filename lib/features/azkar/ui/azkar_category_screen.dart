import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_text_styles.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: MyTextStyles.appBarTextStyle.copyWith(fontFamily: "Amiri"),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is AzkarLoaded) {
            azkarCount.addAll(List.generate(state.azkar.length, (index) => 0));
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
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
