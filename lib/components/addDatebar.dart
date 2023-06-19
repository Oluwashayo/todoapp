// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../ui/theme.dart';

class AddDateBaar extends StatelessWidget {
  Function(DateTime)? onDateChanged;
  AddDateBaar({
    Key? key,
    this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 75,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        dateTextStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "fonts/lato-regular.ttf"),
        dayTextStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "fonts/lato-regular.ttf",
        ),
        monthTextStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: "fonts/lato-regular.ttf",
        ),
        onDateChange: onDateChanged,
      ),
    );
  }
}
