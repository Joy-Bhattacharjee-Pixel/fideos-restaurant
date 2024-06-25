import 'package:fideos_restaurant/models/food.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {

  // Add food form key 
  GlobalKey<FormState> foodAddFormKey  = GlobalKey();

  // Food name controller 
  final nameController = TextEditingController();
  // Food description controller 
  final descriptionController = TextEditingController();
  // Food  controller 
  final priceController = TextEditingController();

  

  // Boolean value for food loading
  RxBool foodLoading = false.obs;

  // List of food model
  RxList<Food> foods = <Food>[].obs;

  // Fetching all foods
  allFoods() async {
    // Stating loader for food fetch
    foodLoading.value = true;

    // Creating new food model
    final food = Food();

    // Fetching id from the saved cookieManager
    final id = await CookieManager("id").get();

    // Fetching all foods using food model
    final foodResponse = await food.allFoods(restaurantId: id!);

    // if response error
    if (foodResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(foodResponse["error"]);
    } else if (foodResponse["success"] != null) {
      // When resposne is not null
      foods.assignAll(foodResponse["success"]);

      // Refreshing foods 
      foods.refresh();
      // Showing error maessage
      FlashManager().show("Foods fetched successfully");
    }

    foodLoading.value = false;
  }
}
