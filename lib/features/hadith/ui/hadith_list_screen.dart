import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/search_app_bar.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/hadith/logic/hadith_cubit.dart';
import 'package:noor/features/hadith/logic/hadith_state.dart';
import 'package:noor/features/hadith/ui/widgets/hadith_widget.dart';

class HadithListScreen extends StatefulWidget {
  final Kitab type;
  const HadithListScreen({super.key, required this.type});

  @override
  State<HadithListScreen> createState() => _HadithListScreenState();
}

class _HadithListScreenState extends State<HadithListScreen> {
  late final HadithCubit hadithCubit = context.read();
  int page = 0;
  bool isSearching = false;
  String value = "";

  @override
  void initState() {
    super.initState();
    hadithCubit.getKitab(widget.type, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: widget.type.name,
        onstartSearch: (bool isSearching) {
          setState(() {
            this.isSearching = isSearching;
            value = "";
          });
          hadithCubit.clearList();
          Future.delayed(const Duration(milliseconds: 1), () {
            if (!isSearching) {
              page = 0;
              hadithCubit.getKitab(widget.type, page);
            }
          });
        },
        onSearch: (value) {
          if (value.isEmpty) {
            hadithCubit.clearList();
            return;
          }
          setState(() {
            this.value = value;
            page = 0;
          });
          hadithCubit.search(widget.type, page, value);
        },
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: BlocBuilder<HadithCubit, HadithState>(
            builder: (context, state) {
              if (state is HadithLoaded) {
                return ListView.builder(
                  itemCount: state.hadiths.length,
                  itemBuilder: (context, index) {
                    if (index == state.hadiths.length - 5) {
                      if (!isSearching) {
                        hadithCubit.getKitab(widget.type, ++page);
                      } else {
                        hadithCubit.search(widget.type, ++page, value);
                      }
                    }
                    return HadithWidget(
                      textAr: state.hadiths[index].arab,
                      textEn: state.hadiths[index].terjemah,
                      hadithNumber: state.hadiths[index].number,
                      searchValue: value,
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
