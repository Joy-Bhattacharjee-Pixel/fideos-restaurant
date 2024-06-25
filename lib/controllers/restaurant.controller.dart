import 'dart:developer';
import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/presentations/profile/profile.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
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
    log(id.toString());

    final fetchDetailsResponse = await restaurant.restaurantDetails(id: id!);

    // if response error
    if (fetchDetailsResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(fetchDetailsResponse["error"]);
      // If response success
    } else if (fetchDetailsResponse["success"] != null) {

      // Showing error maessage
      FlashManager().show("Fetch Details successfully");

      // log(fetchDetailsResponse["success"].toString());

      // Parsing the restaurantData value into string 
      restaurantData.value = Restaurant.fromJson(fetchDetailsResponse["success"]);


    }
    // Stop loader for resturant Details
    restaurantDetailsProcessing.value = false;
  }
}