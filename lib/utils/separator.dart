import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';

class Separator {
  final double horizontalPadding;
  final double verticalPadding;
  final String text;
  Separator(
      {this.horizontalPadding = 15,
      this.verticalPadding = 0,
      required this.text});

  show() => Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // expande left side divider
            const Expanded(child: Divider(color: Colors.black12)),

            // text between two divider
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Text(text,
                    style: TextStyle(color: ColorManager.grey, fontSize: 12))),

            // expande right side divider
            const Expanded(child: Divider(color: Colors.black12))
          ]));
}
