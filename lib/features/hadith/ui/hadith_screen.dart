import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/hadith/ui/widgets/hadith_button.dart';

import '../../../generated/l10n.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.current.hadith),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Column(
                children: [
                  HadithButton(
                    title: S.current.sahih_bukhari,
                    subtitle: S.current.authentic_hadith_collection,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.hadithList,
                        arguments: Kitab.sahihBukhari,
                      );
                    },
                    image: Assets.assetsImagesPngSahihAlBukhari,
                  ),
                  const SizedBox(height: 25),
                  HadithButton(
                    title: S.current.sahih_muslim,
                    subtitle: S.current.authentic_hadith_collection,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.hadithList,
                        arguments: Kitab.sahihMuslim,
                      );
                    },
                    image: Assets.assetsImagesPngSahihMuslim,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
