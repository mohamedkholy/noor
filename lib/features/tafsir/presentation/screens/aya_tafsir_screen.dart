import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/core/widgets/my_error_widget.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';
import 'package:noor/features/tafsir/presentation/manager/cubit/aya_tafsir_cubit.dart';
import 'package:noor/generated/l10n.dart';

class AyaTafsirScreen extends StatefulWidget {
  final Tafsir tafsir;
  final int ayaNumber;
  final int surahNumber;

  const AyaTafsirScreen({
    super.key,
    required this.tafsir,
    required this.ayaNumber,
    required this.surahNumber,
  });

  @override
  State<AyaTafsirScreen> createState() => _AyaTafsirScreenState();
}

class _AyaTafsirScreenState extends State<AyaTafsirScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AyaTafsirCubit>().getAyaTafsir(
      tafseerId: widget.tafsir.id!,
      suraNumber: widget.surahNumber,
      ayahNumber: widget.ayaNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: widget.tafsir.name ?? S.of(context).tafsir),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SafeArea(
            child: BlocBuilder<AyaTafsirCubit, AyaTafsirState>(
              builder: (context, state) {
                if (state is AyaTafsirLoading || state is AyaTafsirInitial) {
                  return const Center(
                    child: CircularProgressIndicator(color: MyColors.primary),
                  );
                }
                if (state is AyaTafsirError) {
                  return MyErrorWidget(
                    error: state.failure,
                    onRetry: () {
                      context.read<AyaTafsirCubit>().getAyaTafsir(
                        tafseerId: widget.tafsir.id!,
                        suraNumber: widget.surahNumber,
                        ayahNumber: widget.ayaNumber,
                      );
                    },
                  );
                }
                if (state is AyaTafsirSuccess) {
                  final ayaTafsir = state.data;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: MyColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: MyColors.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    ayaTafsir.tafseerName ??
                                        widget.tafsir.name ??
                                        '',
                                    style: MyTextStyles.f18CairoSemiBoldPrimary,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.menu_book_rounded,
                                    color: MyColors.primary,
                                    size: 22,
                                  ),
                                ],
                              ),
                              if (widget.tafsir.author != null &&
                                  widget.tafsir.author!.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  widget.tafsir.author!,
                                  style: MyTextStyles.font15greyRegular,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                              if (widget.tafsir.bookName != null &&
                                  widget.tafsir.bookName!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  widget.tafsir.bookName!,
                                  style: MyTextStyles.font15RegularGrey,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: MyColors.secondary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: MyColors.secondary.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                            ),
                            child: Text(
                              '${S.of(context).aya} ${widget.ayaNumber} - ${S.of(context).surah} ${widget.surahNumber}',
                              style: const TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 14,
                                color: Color(0xFF7A6000),
                                fontWeight: FontWeight.w600,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Divider(color: MyColors.primary.withValues(alpha: 0.2)),
                        const SizedBox(height: 20),
                        Text(
                          ayaTafsir.text ?? '',
                          style: const TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 19,
                            height: 2.2,
                            color: Color(0xFF1A1A1A),
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
