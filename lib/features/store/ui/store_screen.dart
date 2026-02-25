import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/store/ui/widgets/section_widget.dart';
import 'package:noor/generated/l10n.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late final List<(String, String, String)> sections;

  @override
  void didChangeDependencies() {
    sections = [
      (
        S.of(context).sRealEstateSection,
        Assets.assetsImagesPngPalace,
        MyRoutes.properties,
      ),
      (
        S.of(context).sLandsSection,
        Assets.assetsImagesPngField,
        MyRoutes.lands,
      ),
      (
        S.of(context).sAgricultureSection,
        Assets.assetsImagesPngForest,
        MyRoutes.agri,
      ),
      (
        S.of(context).sTreasuresSection,
        Assets.assetsImagesPngTreasure,
        MyRoutes.treasures,
      ),
      (
        S.of(context).sHajjSection,
        Assets.assetsImagesPngPalace,
        MyRoutes.properties,
      ),
      (
        S.of(context).sUmrahSection,
        Assets.assetsImagesPngPalace,
        MyRoutes.properties,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).the_hereafter_store),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: DynamicHeightGridView(
              builder: (context, index) {
                return SectionWidget(
                  onTap: () {
                    Navigator.pushNamed(context, sections[index].$3);
                  },
                  title: sections[index].$1,
                  icon: sections[index].$2,
                );
              },
              itemCount: 6,
              crossAxisCount: 2,
            ),
          ),
        ),
      ),
    );
  }
}
