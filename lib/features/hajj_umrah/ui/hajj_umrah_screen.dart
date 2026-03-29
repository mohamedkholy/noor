import 'package:flutter/material.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/hajj_umrah/ui/widgets/count_hajj_umrah_widget.dart';
import 'package:noor/features/hajj_umrah/ui/widgets/hajj_umrah_count_widget.dart';
import 'package:noor/features/hajj_umrah/ui/widgets/reward_widget.dart';
import 'package:noor/generated/l10n.dart';

class HajjUmrahScreen extends StatelessWidget {
  const HajjUmrahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).sLandsSection),
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
                  HajjUmrahCountWidget(),
                  SizedBox(height: 20),
                  RewardWidget(),
                  SizedBox(height: 20),
                  CountHajjUmrahWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
