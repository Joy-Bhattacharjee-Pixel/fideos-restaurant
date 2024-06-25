import 'dart:developer';

import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMenuController extends GetxController {
  // Name field controller for menu screen
  final TextEditingController menuNameController = TextEditingController();
  // Description field controller for menu screen
  final TextEditingController menudescriptionController =
      TextEditingController();

  // Fetch menu button loading
  RxBool fetchmenuLoading = false.obs;

  // Create menu button loading
  RxBool menucreateLoading = false.obs;

  // Add menu function
 addMenu() async {
    // Restaurant create menu process start
    menucreateLoading.value = true;

    // Create menu class instance
    final Restaurant restaurant = Restaurant(
        name: menuNameController.text.trim(),
        description: menudescriptionController.text.trim());

    // Create restaurat function from the class
    final addresponse = await restaurant.addmenu();

    // Check for error in the response
    if (addresponse["error"] != null) {
      FlashManager().show(addresponse["error"]);
    }

    // Check for success in the response
    if (addresponse["success"] != null) {
      log(addresponse["success"].toString());

      // Add new menu successfully - show this message
      FlashManager().show("Add new menu successfully");

      // Navigate to the screen
      Get.to(() => Container());
    }

    // Restaurant create menu process successfully
    menucreateLoading.value = false;
  }

// Fetching Menu Details
  fetchmenudetails() async {
    // Starting loader for menu Details
    fetchmenuLoading.value = true;

    // Creating restaurat
    final restaurant = Restaurant();
    // Fetching id from the saved cookieManager
    final id = await CookieManager("id").get();
    log(id.toString());

    final fetchMenuResponse = await restaurant.fetchmenu(restaurantId: id.toString());

    // if response error
    if (fetchMenuResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(fetchMenuResponse["error"]);
      // If response success
    } else if (fetchMenuResponse["success"] != null) {
      // Showing error maessage
      FlashManager().show("Fetch Menu successfully");

      log(fetchMenuResponse["success"].toString());
    }
    // Stop loader for menu Details
    fetchmenuLoading.value = false;
  }
}
