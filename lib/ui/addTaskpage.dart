import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/components/button.dart';
import 'package:todoapp/components/input_field.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/ui/theme.dart';

class AddTaskpage extends StatefulWidget {
  const AddTaskpage({super.key});

  @override
  State<AddTaskpage> createState() => _AddTaskpageState();
}

class _AddTaskpageState extends State<AddTaskpage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titledController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 pm";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedReminder = 5;
  List<int> reminderList = [
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = "None";
  List<String> repeatList = [
    "none",
    "Daliy",
    "Weekly",
    "Monthly",
  ];

  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
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
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              MyInputField(
                title: "Title",
                hint: "Enter your title",
                controller: _titledController,
              ),
              MyInputField(
                title: "Note",
                hint: "Enter note here",
                controller: _noteController,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () => _getDateFromUser(),
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartedTime: true),
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartedTime: false),
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                title: "Remind",
                hint: "$_selectedReminder minutes early",
                widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(height: 0),
                    onChanged: (value) => setState(() {
                          _selectedReminder = int.parse(value!);
                        }),
                    items: reminderList.map<DropdownMenuItem<String>>(
                      (int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      },
                    ).toList()),
              ),
              MyInputField(
                title: "Repeat",
                hint: _selectedRepeat,
                widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(height: 0),
                    onChanged: (value) => setState(() {
                          _selectedRepeat = value!;
                        }),
                    items: repeatList.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      },
                    ).toList()),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color", style: titleStyle),
                      Wrap(
                        children: List<Widget>.generate(
                          3,
                          (index) => GestureDetector(
                            onTap: () => setState(() {
                              _selectedColor = index;
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, right: 5),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: index == 0
                                    ? primaryClr
                                    : index == 1
                                        ? pinkClr
                                        : yellowClr,
                                child: _selectedColor == index
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 16,
                                      )
                                    : Container(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyButton(
                    text: "Create Task",
                    onTap: () => _validateData(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// This function is used to validate the data of the form input
  _validateData() {
    if (_titledController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titledController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "",
        snackPosition: SnackPosition.BOTTOM,
        colorText: pinkClr,
        messageText: const Text(
          "All Fields are required",
          style: TextStyle(
            color: yellowClr,
          ),
        ),
        backgroundColor: Colors.grey[900],
        icon: const Icon(Icons.warning_amber_outlined, color: Colors.yellow),
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      );
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
      task: Task(
        note: _noteController.text,
        title: _titledController.text,
        color: _selectedColor,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        remind: _selectedReminder,
        repeat: _selectedRepeat,
        isCompleted: 0,
      ),
    );
    print("My id is $value");
  }

// This is function to pick date in the textform field
  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2100),
    );

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      debugPrint("it's null or something went wrong");
    }
  }

// This is function to pick time in the textform field
  _getTimeFromUser({required bool isStartedTime}) async {
    TimeOfDay? pickerTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.now(),
    );

    if (pickerTime == null) {
      print("No Time selected");
    } else if (isStartedTime == true) {
      setState(() {
        _startTime = pickerTime.format(context);
      });
    } else if (isStartedTime == false) {
      setState(() {
        _endTime = pickerTime.format(context);
      });
    }
  }
}
