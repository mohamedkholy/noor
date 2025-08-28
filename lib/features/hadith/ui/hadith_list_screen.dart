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
  String? query;

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
          page = 0;
          query = "";
          if (!isSearching) {
            Future.delayed(const Duration(milliseconds: 100), () {
              hadithCubit.getKitab(widget.type, page);
            });
          }
        },
        onSearch: (value) {
          setState(() {
            query = value;
          });
          page = 0;
          hadithCubit.getKitab(widget.type, page, value);
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
                      hadithCubit.getKitab(widget.type, ++page, query);
                    }
                    return HadithWidget(
                      textAr: state.hadiths[index].arab,
                      textEn: state.hadiths[index].terjemah,
                      hadithNumber: state.hadiths[index].number,
                      searchValue: query ?? "",
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
