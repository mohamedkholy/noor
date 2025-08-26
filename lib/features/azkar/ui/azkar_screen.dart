import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/search_app_bar.dart';
import 'package:noor/features/azkar/logic/azkar_cubit.dart';
import 'package:noor/features/azkar/logic/azkar_state.dart';
import 'package:noor/features/azkar/ui/widgets/azkar_category_widget.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late final AzkarCubit azkarCubit = context.read();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    azkarCubit.addAzkarCategoriesListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: "Azkar",
        onSearch: (value) {
          azkarCubit.search(value);
        },
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BlocBuilder<AzkarCubit, AzkarState>(
            builder: (context, state) {
              if (state is AzkarCategoriesLoaded) {
                return state.azkarCategories.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.azkarCategories.length,
                        itemBuilder: (context, index) {
                          final azkarCategory = state.azkarCategories[index];
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: index == state.azkarCategories.length - 1
                                  ? 15
                                  : 5,
                              top: index == 0 ? 15 : 5,
                              left: 10,
                              right: 10,
                            ),
                            child: AzkarCategoryWidget(
                              category: azkarCategory,
                              onToggleFavorite: (category) {
                                azkarCubit.toggleFavorite(index);
                              },
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("No result found"));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
