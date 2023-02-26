import 'package:flutter/material.dart';

extension NumberExtension on num {
  /// creates an empty SizedBox with [height] as given value
  ///
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  /// creates an empty SizedBox with [width] as given value
  ///
  SizedBox get wSizedBox => SizedBox(width: toDouble());

  /// creates a divider with [thickness] as given value
  ///
  Divider get divider => Divider(
        thickness: toDouble(),
        color: const Color(0xffE7E7E7),
      );
}
