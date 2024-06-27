import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';

class DropDownManager {
  List<String> items;
  Function onChanged;
  String value;
  String hint;

  DropDownManager(
      {required this.items,
      required this.onChanged,
      required this.value,
      required this.hint});

  dropdown() => DropdownButtonFormField<String>(
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(hint, style: TextStyle(color: ColorManager.grey)),
        ),
        decoration: InputDecoration(
            border: _border,
            enabledBorder: _border,
            filled: false,
            hintText: hint,
            label: Text(hint)),
        value: value,
        items: List.generate(
            items.length, (index) => menuItem(item: items[index])),
        onChanged: (value) {
          onChanged(value ?? "");
        },
      );

  OutlineInputBorder get _border =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.black26));

  DropdownMenuItem<String> menuItem({required String item}) => DropdownMenuItem(
        value: item,
        child: Text(item, style: const TextStyle(fontSize: 14)),
      );
}
