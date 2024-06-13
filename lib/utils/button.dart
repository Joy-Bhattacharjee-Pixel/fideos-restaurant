import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonManager {
  String text;
  Function() onPressed;

  ButtonManager({required this.onPressed, required this.text});

  elevated() => ElevatedButton(onPressed: () => onPressed(), style: elevatedStyle(), child: Text(text, style: const TextStyle(color: Colors.white)));

  elevatedStyle() => ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF437FF7),
        fixedSize: Size(Get.width, 43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      );

  outline() => OutlinedButton(onPressed: () => onPressed(), style: outlineStyle(), child: Text(text));

  outlineStyle() => OutlinedButton.styleFrom(
        fixedSize: Size(Get.width, 43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        side: const BorderSide(color: Color(0xFF437FF7)),
      );
}
