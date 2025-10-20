import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/data/models/quran_reader.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';

class QariDropdownWidget extends StatelessWidget {
  final Function(QuranReader) onChanged;
  const QariDropdownWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<QuranReader>(
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          dropdownColor: Colors.black87,
          borderRadius: BorderRadius.circular(10),
          isExpanded: true,
          value: context.read<QuranCubit>().currentQuranReaderNotifier,
          onChanged: (value) {
            if (value == null) return;
            onChanged(value);
          },
          items: QuranCubit.quranReader.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Cairo",
                  fontWeight: FontWeightHelper.semiBold,
                ),
                Localizations.localeOf(context).languageCode == "ar"
                    ? e.nameAr
                    : e.nameEn,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
