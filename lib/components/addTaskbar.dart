// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ui/theme.dart';
import 'button.dart';

class AddTaskbar extends StatelessWidget {
  String text;
  Function()? onTap;
  AddTaskbar({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              const SizedBox(height: 5),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            text: text,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
