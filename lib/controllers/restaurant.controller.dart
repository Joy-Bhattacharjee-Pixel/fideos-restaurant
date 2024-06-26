import 'dart:developer';
import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  //  Name field controller for Edit screen
  final TextEditingController editNameController = TextEditingController();
  //  Phone field controller for Edit screen
  final TextEditingController editPhoneController = TextEditingController();
  //  Address field controller for Edit screen
  final TextEditingController editAddressController = TextEditingController();

  Rx<Restaurant> restaurantData = Restaurant().obs;

  // Boolean parameter resturant Details
  RxBool restaurantDetailsProcessing = false.obs;

// Fetching resturant Details
  fetchDetails() async {
    // Starting loader for resturant Details
    restaurantDetailsProcessing.value = true;

    // Creating restaurat
    final restaurant = Restaurant();

    // Fetching id from the saved cookieManager
    final id = await CookieManager("id").get();

    final fetchDetailsResponse = await restaurant.restaurantDetails(id: id!);

    // if response error
    if (fetchDetailsResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(fetchDetailsResponse["error"]);

      // If response success
    } else if (fetchDetailsResponse["success"] != null) {
      // Showing error maessage
      FlashManager().show("Fetch Details successfully");

      // Parsing the restaurantData value into string
      restaurantData.value =
          Restaurant.fromJson(fetchDetailsResponse["success"]);
      restaurantData.refresh();
    }
    // Stop loader for resturant Details
    restaurantDetailsProcessing.value = false;
  }
}
