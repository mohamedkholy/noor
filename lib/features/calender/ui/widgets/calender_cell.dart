import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderCell extends StatelessWidget {
  const CalenderCell({
    super.key,
    required this.isSelected,
    required this.cellDetails,
  });

  final bool isSelected;
  final HijriDateRangePickerCellDetails cellDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.black : Colors.transparent,
        border:
            cellDetails.date.toDateTime() == DateUtils.dateOnly(DateTime.now())
            ? Border.all()
            : null,
      ),
      width: cellDetails.bounds.width,
      height: cellDetails.bounds.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            maxLines: 1,
            cellDetails.date.day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeightHelper.medium,
              fontSize: isSelected ? 14 : 12,
            ),
          ),
          AutoSizeText(
            maxLines: 1,
            DateFormat.d().format(cellDetails.date.toDateTime()),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeightHelper.medium,
              fontSize: isSelected ? 12 : 10,
            ),
          ),
        ],
      ),
    );
  }
}
