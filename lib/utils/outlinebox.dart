import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutlineBoxManager extends StatelessWidget {
  final String text;
  final double border;
  final bool fontFamily;
  final double? width;
  final Color? color;
  final double opacity;
  final Function? onTap;

  const OutlineBoxManager({
    super.key,
    required this.text,
    this.border = 1,
    this.fontFamily = false,
    this.color,
    this.width,
    this.opacity = 1,
     this.onTap
    
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          // Container wisth
          width: width ?? Get.width,
          // Container padding
          padding: const EdgeInsets.all(10),
          // Container margin
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          // Decoration
          decoration: BoxDecoration(
              // Container border
              border: Border.all(
                  // Container border color
                  color: color!.withOpacity(opacity),
                  // Container border width
                  width: border),
              //  Contaner border radius
              borderRadius: BorderRadius.circular(7)),
          // Container alignment
          alignment: Alignment.center,
          child: Text(text,
              style: TextStyle(
                  // Text color
                  color: color ?? ColorManager.primary
                  // fontFamily: fontFamily ? Fonts.medium : Fonts.regular
                  ))),
    );
  }
}
