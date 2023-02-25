// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VertText extends StatelessWidget {
  const VertText({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          title,
          style: titleStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),

        // subtitle
        Text(
          subtitle,
          style: subtitleStyle ??
              const TextStyle(
                fontSize: 12,
                color: Color(0xff717171),
              ),
        )
      ],
    );
  }
}
