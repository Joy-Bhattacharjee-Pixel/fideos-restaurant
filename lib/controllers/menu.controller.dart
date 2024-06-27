import 'dart:developer';

import 'package:fideos_restaurant/models/menu.dart';
import 'package:fideos_restaurant/presentations/menu/add.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantMenuController extends GetxController {
  // Name field controller for menu screen
  final TextEditingController menuNameController = TextEditingController();
  // Description field controller for menu screen
  final TextEditingController menudescriptionController =
      TextEditingController();

  // Fetch menu button loading
  RxBool menuLoading = false.obs;

  // Add menu button loading
  RxBool menuaddLoading = false.obs;

  // List of menu model
  RxList<Menu> menus = <Menu>[].obs;

  // Add menu function
  addMenu() async {
    // Restaurant create menu process start
    menuaddLoading.value = true;

    // Fetching id from the saved cookieManager
    final id = await CookieManager("id").get();
    log(id.toString());
    // Create menu class instance
    final Menu menu = Menu(
        name: menuNameController.text.trim(),
        description: menudescriptionController.text.trim());

    // Create restaurat function from the class
    final addresponse = await menu.addmenu(id: id!);

    // Check for error in the response
    if (addresponse["error"] != null) {
      FlashManager().show(addresponse["error"]);
    }

    // Check for success in the response
    if (addresponse["success"] != null) {
      log(addresponse["success"].toString());
      // menus.assignAll();
      // Refreshing menus
      allMenus();

      // Add new menu successfully - show this message
      FlashManager().show("Add new menu successfully");
      // Navigate to the screen
      Get.back();
    }

    // Restaurant create menu process successfully
    menuaddLoading.value = false;
  }

// Fetching Menu Details
  // fetchmenudetails() async {
  //   // Starting loader for menu Details
  //   fetchmenuLoading.value = true;

  //   // Creating menu isntance
  //   final menu = Menu();
  //   // Fetching id from the saved cookieManager
  //   final id = await CookieManager("id").get();
  //   log(id.toString());

  //   final fetchMenuResponse = await menu.fetchmenu(restaurantId: id.toString());

  //   // if response error
  //   if (fetchMenuResponse["error"] != null) {
  //     // Showing error maessage
  //     FlashManager().show(fetchMenuResponse["error"]);
  //     // If response success
  //   } else if (fetchMenuResponse["success"] != null) {
  //     // Assigning all menu coming from response to model = List of menu model
  //     menus.assignAll(fetchMenuResponse["Success"]);

  //     // Refreshing list of menu
  //     menus.refresh();
  //     // Showing error maessage
  //     FlashManager().show("Fetch Menu successfully");
  //   }
  //   // Stop loader for menu Details
  //   fetchmenuLoading.value = false;
  // }
  // Fetching all foods
  allMenus() async {
    // Stating loader for menu fetch
    menuLoading.value = true;

    // Creating new menu model
    final menu = Menu();

    // Fetching id from the saved cookieManager
    final id = await CookieManager("id").get();

    // Fetching all menus using food model
    final menuResponse = await menu.fetchmenu(restaurantId: id!);

    // if response error
    if (menuResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(menuResponse["error"]);
    } else if (menuResponse["success"] != null) {
      // When resposne is not null
      menus.assignAll(menuResponse["success"]);

      // Refreshing menus
      menus.refresh();
      // Showing error maessage
      FlashManager().show("Menus fetched successfully");
    }

    // Stopping loader for menu loading
    menuLoading.value = false;
  }
}
