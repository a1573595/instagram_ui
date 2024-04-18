import 'package:flutter/material.dart';

extension SizeExtension on Size {
  double get radius => height > width ? width : height;
}