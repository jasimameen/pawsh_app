import 'package:flutter/cupertino.dart';

void pickDate(BuildContext context) {
  final action = CupertinoActionSheet(
    message: const Text(
      "Schedule an Appointment below",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        minimumDate: DateTime.now(),
        onDateTimeChanged: (value) {},
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );

  showCupertinoModalPopup(context: context, builder: (context) => action);
}
