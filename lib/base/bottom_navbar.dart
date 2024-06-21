
import 'package:fideos_restaurant/controllers/base.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // Importing basecontroller
  final controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.white),
            child: Obx(() => BottomNavigationBar(
                onTap: (index) {
                  if (index == 0) {
                    Get.deleteAll();
                  }
                  controller.onchange(index: index);
                },
                currentIndex: controller.selected.value,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: Colors.black,
                selectedItemColor: ColorManager.primary,
                selectedLabelStyle:
                    TextStyle(fontSize: 11, color: ColorManager.primary),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 11, color: Colors.black),
                selectedIconTheme:
                    IconThemeData(color: ColorManager.primary, size: 20),
                unselectedIconTheme:
                    const IconThemeData(color: Colors.black, size: 20),
                items: List.generate(
                    4,
                    (index) => items(
                        image: controller.image[index],
                        label: controller.screennames[index]))))));
  }

// Bottom navbar icon and label
  BottomNavigationBarItem items(
          {required Image image, required String label}) =>
      BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 2),
              child: image),
          label: label);
}
