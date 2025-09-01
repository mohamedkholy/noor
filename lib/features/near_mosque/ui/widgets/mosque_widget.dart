import 'package:flutter/material.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/generated/l10n.dart';

class MosqueWidget extends StatelessWidget {
  const MosqueWidget({super.key, required this.mosque});

  final MosqueData mosque;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                mosque.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primary,
              ),
              child: const Icon(Icons.near_me, size: 15, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Text(
                mosque.address ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text("${mosque.distance.toStringAsFixed(2)} ${S.current.km}"),
          ],
        ),
      ],
    );
  }
}
