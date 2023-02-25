// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pawsh_app/core/extensions.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // button
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(iconData),
        ),

        4.hSizedBox,

        // label
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
