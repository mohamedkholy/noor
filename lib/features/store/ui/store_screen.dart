import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
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
  final sections = [
    ("قسم العقارات", FluentIcons.building_24_regular, MyRoutes.properties),
    ("قسم الأراضى", FluentIcons.globe_surface_24_regular, MyRoutes.properties),
    ("قسم الزراعة", FluentIcons.leaf_one_16_filled, MyRoutes.properties),
    ("قسم الكنوز", FluentIcons.trophy_24_regular, MyRoutes.properties),
    ("قسم الحج", FluentIcons.building_mosque_24_regular, MyRoutes.properties),
    ("قسم العمرة", FluentIcons.building_mosque_24_filled, MyRoutes.properties),
  ];

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
