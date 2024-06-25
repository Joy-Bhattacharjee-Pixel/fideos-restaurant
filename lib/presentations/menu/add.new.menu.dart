
import 'package:fideos_restaurant/controllers/menu.controller.dart';
import 'package:fideos_restaurant/presentations/menu/add.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewMenu extends StatefulWidget {
  const AddNewMenu({super.key});

  @override
  State<AddNewMenu> createState() => _AddNewMenuState();
}

class _AddNewMenuState extends State<AddNewMenu> {

  // Importing menu controller
  final _controller = AddMenuController();

  @override
  void initState() {
    super.initState();
    _controller.fetchmenudetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        // Title
        const Text("Domino's Pizza",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold)),

        // Sub title
        const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(fontSize: 13, color: Colors.black)),

        // Adding some space
        const SizedBox(height: 15),

        // Divider
        Divider(color: Colors.grey.withOpacity(0.2)),

        // Adding some space
        const SizedBox(height: 10),

        // All new menu field

        // Name field
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextFieldService(
                    controller: _controller.menuNameController,
                    validator: (name) =>
                        _validator(value: name, fieldName: "Name"),
                    hint: "Name")
                .show()),

        // Description field
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextFieldService(
                    controller: _controller.menudescriptionController,
                    validator: (description) => _validator(
                        value: description, fieldName: "Description"),
                    hint: "Description")
                .show()),

        // Add new menu button
        Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: ButtonManager(onPressed: () {
              Get.to(()=>AddMenu());
            }, text: "Add New Menu")
                .elevated()),
      ]),
    )));
  }

  // Field validator
  _validator({String? value, String? fieldName}) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid $fieldName";
    }
  }
}
