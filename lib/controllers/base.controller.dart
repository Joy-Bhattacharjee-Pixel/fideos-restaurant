import 'package:fideos_restaurant/presentations/order/order_screen.dart';
import 'package:fideos_restaurant/presentations/product/product.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // List of image
  List<Image> image = [
    Image.asset("assets/nav_icon_5.png", height: 25),
    Image.asset("assets/nav_icon_5.png", height: 25),
    Image.asset("assets/nav_icon_2.png", height: 25),
    Image.asset("assets/nav_icon_2.png", height: 25)
  ];

  // List of screen name
  List<String> screennames = [
    "Pending Orders",
    "Completed Order",
    "Products",
    "Profile"
  ];

  // List of screen
  List<Widget> screens = [
    const ProductScreen(),
    const OrderScreen(),
    const ProductScreen(),
    const SizedBox()
  ];

  Rx<int> selected = 0.obs;

  void onchange({required int index}) => selected.value = index;

// List of drawer items
  List<DrawerModel> draweritems = [
    DrawerModel(icon: Icons.verified_user, title: "Edit Profile"),
    DrawerModel(icon: Icons.add_box, title: "Orders"),
    DrawerModel(icon: Icons.book_online_outlined, title: "Reservations"),
    DrawerModel(icon: Icons.category_outlined, title: "Products")
  ];
}

// Drawer model
class DrawerModel {
  String title;
  IconData icon;
  DrawerModel({required this.icon, required this.title});
}
