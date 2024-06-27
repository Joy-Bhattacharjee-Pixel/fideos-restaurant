import 'dart:developer';
import 'dart:io';

import 'package:fideos_restaurant/controllers/food.controller.dart';
import 'package:fideos_restaurant/controllers/menu.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/dropdown.dart';
import 'package:fideos_restaurant/utils/loader.dart';
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

  // Importing menu controller
  final _menuController = Get.put(RestaurantMenuController());

  @override
  void initState() {
    super.initState();
    _fecthMenu();
  }

  // Fetch menu
  _fecthMenu() {
    _menuController.allMenus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Form(
              key: _controller.foodAddFormKey,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    // Food name field
                    TextFieldService(
                            controller: _controller.nameController,
                            hint: "Name")
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
                    Obx(() => _menuController.menuLoading.value
                        ? Loader().show()
                        : DropDownManager(
                            items: _menuController.menus
                                .map((element) => element.name.toString())
                                .toList(),
                            onChanged: (value) {
                              // Selected menu
                              _controller.selectedMenu.value = value.toString();

                              // Selected menu id 
                              _controller.selectedMenuId.value = _menuController
                                  .menus
                                  .firstWhere((element) =>
                                      element.name ==
                                      _controller.selectedMenu.value)
                                  .id
                                  .toString();
                            },
                            hint: "Menu",
                            value: _controller.selectedMenu.value.isEmpty
                                ? _menuController.menus[0].name.toString()
                                : _controller.selectedMenu.value,
                          ).dropdown()),

                    // Adding some space
                    const SizedBox(
                      height: 10,
                    ),

                    Obx(() => _controller.selectedImage.value.isEmpty
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: Get.width,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorManager.grey)),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_controller
                                      .selectedImage.value
                                      .toString()))),
                            ),
                          )),
                    // Upload Image container
                    ButtonManager(
                            onPressed: () {
                              _controller.pickImage;
                            },
                            text: "Upload Image")
                        .outline(),

                    // Adding some space
                    const SizedBox(height: 20),

                    // Add button
                    Obx(() => _controller.foodAdding.value
                        ? Loader().show()
                        : ButtonManager(
                                onPressed: () => _addFood(), text: "Add")
                            .elevated())
                  ]))),
        ));
  }

  _appBar() => AppBar(
      // Back button for navigation
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Feather.arrow_left)),
      centerTitle: true,
      title: const Text("Add Food", style: TextStyle(fontSize: 18)));

  // Food adding function
  _addFood() {
    _controller.addFood();
  }
}
