import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/settings/data/models/azkar_type.dart';
import 'package:noor/generated/l10n.dart';

class AzkarNotificationWidget extends StatefulWidget {
  final AzkarType azkarType;
  final bool azkarState;
  final TextEditingController azkarTimeController;
  final Function(bool) onAzkarStateChange;
  final void Function(String)? onAzkarTimeChange;
  const AzkarNotificationWidget({
    super.key,
    required this.azkarType,
    required this.azkarState,
    required this.azkarTimeController,
    required this.onAzkarStateChange,
    required this.onAzkarTimeChange,
  });

  @override
  State<AzkarNotificationWidget> createState() =>
      _AzkarNotificationWidgetState();
}

class _AzkarNotificationWidgetState extends State<AzkarNotificationWidget> {
  late bool azkarState = widget.azkarState;

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TextField(
                  enabled: azkarState,
                  onChanged: widget.onAzkarTimeChange,
                  controller: widget.azkarTimeController,
                  cursorColor: Colors.white,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: azkarState ? Colors.white : Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeightHelper.medium,
                    ),
                    hintText: S.of(context).notification_time,
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                "${S.of(context).minutes_before} ${widget.azkarType == AzkarType.morning ? S.of(context).shorok : S.of(context).maghrib} ",
                style: TextStyle(
                  color: azkarState ? Colors.grey.shade300 : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
