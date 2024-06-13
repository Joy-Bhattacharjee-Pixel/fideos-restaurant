import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';

class Loader {
  show() => CircularProgressIndicator(color: ColorManager.primary, strokeWidth: 2);
}
