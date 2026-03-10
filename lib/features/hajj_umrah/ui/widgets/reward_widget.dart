import 'package:flutter/material.dart';
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
            S.of(context).hajj_umrah_hadith,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
