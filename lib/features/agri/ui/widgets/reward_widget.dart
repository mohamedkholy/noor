import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/generated/l10n.dart';

class RewardWidget extends StatelessWidget {
  const RewardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            S.of(context).properties_reward_title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).agriculture_hadith,
            style: MyTextStyles.font15whiteRegular.copyWith(
              letterSpacing: 1.1,
              wordSpacing: 1.1,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
