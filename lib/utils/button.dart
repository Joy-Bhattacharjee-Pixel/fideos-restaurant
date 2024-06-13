import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonManager {
  String text;

  Color? backgroundcolor;
  Function() onPressed;

  ButtonManager({required this.onPressed, required this.text, this.backgroundcolor});

  elevated() => ElevatedButton(
      onPressed: () => onPressed(),
      style: elevatedStyle(),
      child: Text(text, style: const TextStyle(color: Colors.white)));

  elevatedStyle() => ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        fixedSize: Size(Get.width, 43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      );

  outline() => OutlinedButton(
      onPressed: () => onPressed(), style: outlineStyle(), child: Text(text));

  outlineStyle() => OutlinedButton.styleFrom(
        fixedSize: Size(Get.width, 43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        side: const BorderSide(color: Color(0xFF437FF7)),
      );
}
