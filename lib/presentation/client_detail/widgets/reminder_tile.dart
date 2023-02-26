// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pawsh_app/core/extensions.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    Key? key,
    required this.label,
    required this.iconData,
    this.labelColor,
  }) : super(key: key);

  final String label;
  final IconData iconData;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // icon
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          8.wSizedBox,

          // title
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: labelColor),
            ),
          ),
        ],
      ),
    );
  }
}
