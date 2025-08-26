import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:noor/features/calender/ui/widgets/calender_cell.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderWidget extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  const CalenderWidget({super.key, required this.onDateChanged});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  final HijriDatePickerController _controller = HijriDatePickerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                _controller.backward!();
                setState(() {});
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    AutoSizeText(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      HijriCalendar.fromDate(
                        _controller.displayDate != null
                            ? _controller.displayDate!.toDateTime()
                            : DateTime.now(),
                      ).toFormat("MMMM  yyyy"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AutoSizeText(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      DateFormat.yMMMd().format(
                        _controller.displayDate != null
                            ? _controller.displayDate!.toDateTime()
                            : DateTime.now(),
                      ),
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _controller.forward!();
                setState(() {});
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SfHijriDateRangePicker(
          allowViewNavigation: false,
          controller: _controller,
          headerHeight: 0,
          backgroundColor: Colors.transparent,
          selectionColor: Colors.transparent,
          todayHighlightColor: Colors.black,
          navigationMode: DateRangePickerNavigationMode.none,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            final HijriDateTime date = args.value;
            widget.onDateChanged(date.toDateTime());
          },
          cellBuilder: (context, cellDetails) {
            final isSelected =
                _controller.selectedDate != null &&
                _controller.selectedDate == cellDetails.date;
            return CalenderCell(
              isSelected: isSelected,
              cellDetails: cellDetails,
            );
          },
          minDate: HijriDateTime.now().subtract(const Duration(days: 365)),
          initialSelectedDate: HijriDateTime.now(),
          initialDisplayDate: HijriDateTime.now(),
          maxDate: HijriDateTime.now().add(const Duration(days: 365)),
        ),
      ],
    );
  }
}
