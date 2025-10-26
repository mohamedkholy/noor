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
  late double progress = widget.azkarTime.toDouble();
  late int maxTime = widget.azkarType == AzkarType.sleeping ? 5 : 90;

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
              activeThumbColor: MyColors.secondary,
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
                max: maxTime.toDouble(),
                divisions: maxTime,
                value: progress,
                thumbColor: MyColors.secondary,
                onChanged: (value) {
                  setState(() {
                    progress = value.clamp(1.0, maxTime.toDouble());
                  });
                  widget.onAzkarTimeChange(progress.toInt());
                },
                activeColor: MyColors.secondary,
                inactiveColor: Colors.grey,
              ),
              Text(
                "${progress.toInt()} ${maxTime == 90 ? S.of(context).minutes_before : S.of(context).hour_before} ${widget.azkarType == AzkarType.morning
                    ? S.of(context).shorok
                    : widget.azkarType == AzkarType.evening
                    ? S.of(context).maghrib
                    : S.of(context).beforeMidNight}",
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
