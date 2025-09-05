import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
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
          Text(
            maxLines: 1,
            HijriCalendar.fromDate(
              cellDetails.date.toDateTime(),
            ).toFormat("dd"),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeightHelper.medium,
              fontSize: 15,
            ),
          ),
          Text(
            maxLines: 1,
            DateFormat.d().format(cellDetails.date.toDateTime()),
            style: const TextStyle(
              height: 1,
              color: Colors.orange,
              fontWeight: FontWeightHelper.medium,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
