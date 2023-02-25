// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/vert_text.dart';

import '../../widgets/dash_card.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.selected = false,
  }) : super(key: key);

  final bool selected;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return DashCard(
      width: 105,
      color: selected ? Colors.black : null,
      child: VertText(
        title: title,
        titleStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: selected ? Colors.white : null,
        ),
        subtitle: subtitle,
      ),
    );
  }
}
