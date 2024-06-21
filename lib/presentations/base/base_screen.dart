import 'package:fideos_restaurant/presentations/base/drawer_screen.dart';
import 'package:fideos_restaurant/controllers/base.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_navbar.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  // Importing base controller
  final controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        drawer: const DrawerSection(),
        // Appbar section
        appBar: AppBar(
          centerTitle: true,
          title: Obx(
              () => Text(controller.screennames[controller.selected.value], style: const TextStyle(fontSize: 18),)),
        ),
        bottomNavigationBar: const BottomNavbar(),
        body: Obx(() => controller.screens[controller.selected.value]));
  }
}
