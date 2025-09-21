import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:noor/generated/l10n.dart';

class AzkarNotificationWidget extends StatefulWidget {
  final AzkarType azkarType;
  final bool azkarState;
  final Function(bool) onAzkarStateChange;
  final Function(int) onAzkarTimeChange;
  final int azkarTime;
  const AzkarNotificationWidget({
    super.key,
    required this.azkarType,
    required this.azkarState,
    required this.onAzkarStateChange,
    required this.onAzkarTimeChange,
    required this.azkarTime,
  });

  @override
  State<AzkarNotificationWidget> createState() =>
      _AzkarNotificationWidgetState();
}

class _AzkarNotificationWidgetState extends State<AzkarNotificationWidget> {
  late bool azkarState = widget.azkarState;
  late double progress = widget.azkarTime / 90;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.azkarType.getAzkarName(context),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: MyColors.secondary,
              value: azkarState,
              onChanged: (value) {
                setState(() {
                  azkarState = value;
                });
                widget.onAzkarStateChange(value);
              },
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: azkarState ? Colors.white : Colors.grey),
          ),
          child: Column(
            children: [
              Slider(
                value: progress,
                thumbColor: MyColors.secondary,
                onChanged: (value) {
                  setState(() {
                    progress = value.clamp(0.1, 1);
                  });
                  widget.onAzkarTimeChange((progress * 90).toInt());
                },
                activeColor: MyColors.secondary,
                inactiveColor: Colors.grey,
              ),
              Text(
                "${(progress * 90).toInt()} ${S.of(context).minutes_before} ${widget.azkarType == AzkarType.morning ? S.of(context).shorok : S.of(context).maghrib} ",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
