import 'package:flutter/widgets.dart';

extension NumberExtension on num {
  /// creates an empty SizedBox with [height] as given value
  ///
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  /// creates an empty SizedBox with [width] as given value
  ///
  SizedBox get wSizedBox => SizedBox(width: toDouble());
}
