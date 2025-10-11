import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran_lines/quran_lines_database.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/logic/quran_state.dart';

class MushafScreen extends StatefulWidget {
  final int pageNumber;
  const MushafScreen({super.key, required this.pageNumber});

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {
  late final QuranCubit _quranCubit = context.read();
  final List<List<(Line, List<Word>)>> pages = [];
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _quranCubit.getSurasLines(widget.pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        if (state is QuranLinesLoaded) {
          final currentPage = pages.indexWhere(
            (element) => element.last.$1.pageNumber == widget.pageNumber,
          );
          pageController.jumpToPage(currentPage);
        }
      },
      builder: (context, state) {
        if (state is QuranLinesLoaded) {
          pages.addAll(state.pages);
        } else if (state is QuranLinesLodedFromStart) {
          final currentPage = pageController.page!.toInt() + state.pages.length;
          pages.insertAll(0, state.pages);
          pageController.jumpToPage(currentPage);
        } else if (state is QuranLinesLodedFromEnd) {
          pages.addAll(state.pages);
        }
        return PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];
            if (index == pages.length - 2 &&
                pages.last.last.$1.pageNumber != 604) {
              _quranCubit.getSurasLinesPagination(
                pageNumber: pages.last.last.$1.pageNumber,
                isFromStart: false,
              );
            } else if (index == 2 && pages.first.first.$1.pageNumber != 1) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _quranCubit.getSurasLinesPagination(
                  pageNumber: pages.first.first.$1.pageNumber,
                  isFromStart: true,
                );
              });
            }
            return ListView.builder(
              itemCount: page.length,
              itemBuilder: (context, i) {
                final line = page[i];
                final pageNumber = line.$1.pageNumber;
                return AutoSizeText(
                  line.$2.map((word) => word.wordText).join(' '),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    height: 1.87,
                    color: Colors.black,
                    fontSize: pageNumber == 1 || pageNumber == 2 ? 30 : 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'QCF_P${pageNumber.toString().padLeft(3, '0')}',
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Size measureTextSpan(TextSpan span) {
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.rtl, // for Arabic text
      textAlign: TextAlign.center,
      maxLines: 10,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    return painter.size;
  }
}
