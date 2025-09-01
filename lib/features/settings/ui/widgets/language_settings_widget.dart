import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/logic/language_cubit.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/generated/l10n.dart';

class LanguageSettingsWidget extends StatefulWidget {
  const LanguageSettingsWidget({super.key});

  @override
  State<LanguageSettingsWidget> createState() => _LanguageSettingsWidgetState();
}

class _LanguageSettingsWidgetState extends State<LanguageSettingsWidget> {
  late final LanguageCubit _languageCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String?>(
      builder: (context, state) {
        final language =
            state ?? PlatformDispatcher.instance.locale.languageCode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).language,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            DecoratedContainer(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).app_language,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.black87,
                    value: language,
                    items: [
                      DropdownMenuItem(
                        value: "en",
                        child: Text(
                          S.of(context).english,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "ar",
                        child: Text(
                          S.of(context).arabic,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        _languageCubit.changeLanguage(value);
                      }
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                    underline: const SizedBox.shrink(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
