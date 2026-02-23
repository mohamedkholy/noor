import 'package:flutter/material.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/properties/ui/widgets/properties_count_widget.dart';
import 'package:noor/features/properties/ui/widgets/sunan_widget.dart';
import 'package:noor/generated/l10n.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

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
            child: Column(
              children: [
                const PropertiesCountWidget(),
                const SizedBox(height: 20),
                SunanWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
