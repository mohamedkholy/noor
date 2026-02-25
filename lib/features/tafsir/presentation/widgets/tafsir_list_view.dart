import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';
import 'package:noor/features/tafsir/presentation/manager/cubit/aya_tafsir_cubit.dart';
import 'package:noor/features/tafsir/presentation/manager/cubit/tafsir_cubit.dart';
import 'package:noor/features/tafsir/presentation/screens/aya_tafsir_screen.dart';
import 'package:noor/features/tafsir/presentation/widgets/tafsir_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TafsirListView extends StatelessWidget {
  final int ayaNumber;
  final int surahNumber;

  const TafsirListView({
    super.key,
    required this.ayaNumber,
    required this.surahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TafsirCubit, TafsirState>(
      listener: (context, state) {
        if (state is TafsirError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure)));
          });
        }
      },
      builder: (context, state) {
        final cubit = context.read<TafsirCubit>();
        return Skeletonizer(
          enabled: state is TafsirLoading,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state is TafsirSuccess ? state.data.length : 10,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => getIt<AyaTafsirCubit>(),
                      child: AyaTafsirScreen(
                        tafsir: state is TafsirSuccess
                            ? state.data[index]
                            : const Tafsir(
                                author: '',
                                bookName: '',
                                id: 0,
                                language: '',
                                name: '',
                              ),
                        ayaNumber: ayaNumber,
                        surahNumber: surahNumber,
                      ),
                    ),
                  ),
                );
              },
              child: TafsirItem(
                tafsir: state is TafsirSuccess
                    ? state.data[index]
                    : const Tafsir(
                        author: '',
                        bookName: '',
                        id: 0,
                        language: '',
                        name: '',
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
