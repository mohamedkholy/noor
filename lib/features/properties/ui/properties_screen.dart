import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/properties/logic/properties_cubit.dart';
import 'package:noor/features/properties/ui/widgets/properties_count_widget.dart';
import 'package:noor/features/properties/ui/widgets/reward_widget.dart';
import 'package:noor/features/properties/ui/widgets/sunan_widget.dart';
import 'package:noor/generated/l10n.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  late final PropertiesCubit _cubit = context.read();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).sRealEstateSection),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: const Column(
                children: [
                  PropertiesCountWidget(),
                  SizedBox(height: 20),
                  RewardWidget(),
                  SizedBox(height: 20),
                  SunanWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
