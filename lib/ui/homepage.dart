import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/components/addTaskbar.dart';
import 'package:todoapp/services/notification.dart';
import 'package:todoapp/services/theme_services.dart';
import 'package:todoapp/ui/addTaskpage.dart';

import '../components/addDatebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _selectedDate = DateTime.now();

  var notifyHelper;
  @override
  void initState() {
    notifyHelper = NotifyHelper();
    super.initState();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
          AddTaskbar(
            text: "+ Add Task",
            onTap: () => Get.to(() => const AddTaskpage()),
          ),
          AddDateBaar(onDateChanged: (date) => _selectedDate = date),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme changed",
            body: Get.isDarkMode
                ? "Activated light theme"
                : "Activated dart theme",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage("assets/dress2.jpeg"),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
