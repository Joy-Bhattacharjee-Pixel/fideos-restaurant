import 'package:fideos_restaurant/presentations/menu/add.dart';
import 'package:fideos_restaurant/presentations/menu/add.new.menu.dart';
import 'package:fideos_restaurant/presentations/order/order_screen.dart';
import 'package:fideos_restaurant/presentations/food/foods.dart';
import 'package:fideos_restaurant/presentations/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // List of image

  List<Icon> icon = const [
    Icon(Feather.box),
    Icon(Feather.box),
    Icon(Icons.food_bank_outlined),
    Icon(Feather.user)
  ];

  // List of screen name
  List<String> screennames = ["Pending", "Completed", "Products", "Profile"];

  // List of screen
  List<Widget> screens = [
    const OrderScreen(),
    const OrderScreen(),
    // const FoodScreen(),
    AddMenu(),
    const ProfileScreen()
  ];

  Rx<int> selected = 0.obs;

  void onchange({required int index}) => selected.value = index;

// List of drawer items
  List<DrawerModel> draweritems = [
    DrawerModel(icon: Icons.settings, title: "Edit Profile"),
    DrawerModel(icon: Feather.box, title: "Orders"),
    DrawerModel(icon: Feather.file_text, title: "Reservations"),
    DrawerModel(icon: Icons.food_bank_outlined, title: "Products")
  ];
}

// Drawer model
class DrawerModel {
  String title;
  IconData icon;
  DrawerModel({required this.icon, required this.title});
}
