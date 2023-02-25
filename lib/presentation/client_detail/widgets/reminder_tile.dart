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
    return Row(
      children: [
        // icon
        CircleAvatar(
          radius: 12,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),

        8.wSizedBox,

        // title
        Text(
          label,
          style: TextStyle(color: labelColor),
        ),
      ],
    );
  }
}
