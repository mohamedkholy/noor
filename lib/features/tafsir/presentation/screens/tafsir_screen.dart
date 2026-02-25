import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/tafsir/presentation/manager/cubit/tafsir_cubit.dart';
import 'package:noor/features/tafsir/presentation/widgets/tafsir_list_view.dart';
import 'package:noor/generated/l10n.dart';

class TafsirScreen extends StatefulWidget {
  final int ayaNumber;
  final int surahNumber;

  const TafsirScreen({
    super.key,
    required this.ayaNumber,
    required this.surahNumber,
  });

  @override
  State<TafsirScreen> createState() => _TafsirScreenState();
}

class _TafsirScreenState extends State<TafsirScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TafsirCubit>().getTafsirList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: S.of(context).tafsir),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  TafsirListView(
                    ayaNumber: widget.ayaNumber,
                    surahNumber: widget.surahNumber,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
