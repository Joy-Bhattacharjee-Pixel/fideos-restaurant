import 'package:fideos_restaurant/controllers/food.controller.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/dropdown.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  // Importing controller
  final _controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Form(
            key: _controller.foodAddFormKey,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  // Food name field
                  TextFieldService(
                          controller: _controller.nameController, hint: "Name")
                      .show(),

                  // Adding some space
                  const SizedBox(height: 10),

                  // Food description field
                  TextFieldService(
                          controller: _controller.descriptionController,
                          hint: "Decsription")
                      .show(),

                  // Adding some space
                  const SizedBox(height: 10),

                  // Food price field
                  TextFieldService(
                          controller: _controller.priceController,
                          hint: "Price")
                      .show(),

                  // Adding some space
                  const SizedBox(height: 10),

                  // Menu dropdwon
                  DropDownManager(
                      onChanged: () {},
                      value: "1",
                      hint: "Menu",
                      items: ["1", "2", "3"]).dropdown(),

                  // Adding some space
                  const SizedBox(height: 20),

                  // Add button
                  ButtonManager(onPressed: () {}, text: "Add").elevated()
                ]))));
  }

  _appBar() => AppBar(
      // Back button for navigation
      leading: const Icon(Feather.arrow_left),
      centerTitle: true,
      title: const Text("Add Food", style: TextStyle(fontSize: 18)));
}
