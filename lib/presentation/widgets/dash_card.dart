// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  const DashCard({
    Key? key,
    this.height,
    this.width,
    this.padding,
    this.color,
    required this.child,
  }) : super(key: key);

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? padding;

  final Color? color;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          strokeAlign: StrokeAlign.inside,
          color: const Color(0xffE7E7E7),
        ),
      ),
      child: child,
    );
  }
}
