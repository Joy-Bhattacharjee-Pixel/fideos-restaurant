import 'package:fideos_restaurant/controllers/menu.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/menu/add.new.menu.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  void initState() {
    super.initState();
    _controller.allMenus();
  }

  final _controller = RestaurantMenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        // Title
        const Text("Domino's Pizza",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 21)),

        // Sub title
        const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(fontSize: 13, color: Colors.black)),

        // Adding some space
        const SizedBox(height: 15),

        // Divider
        Divider(color: Colors.grey.withOpacity(0.2)),

        // Adding some space
        const SizedBox(height: 10),

        Obx(() => _controller.menuLoading.value
            ? Loader().show()
            : Column(
                children: [
                  ...List.generate(
                      _controller.menus.length,
                      (index) => Column(children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, bottom: 8),
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            _controller.menus[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      ]),

                                  // Adding some space
                                  const SizedBox(height: 2),

                                  //  Available total food
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            _controller.menus[index].description
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        Text(
                                            _controller.menus[index].status
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13))
                                        // : Text("Disabled",
                                        //     style: TextStyle(
                                        //         color: ColorManager.primary,
                                        //         fontWeight: FontWeight.w300,
                                        //         fontSize: 13))
                                      ])
                                ])),

                            // Divider
                            Divider(color: Colors.grey.withOpacity(0.2)),
                          ])),
                ],
              )),

        // All new menu list

        // Add new menu button

        Obx(() => _controller.menuaddLoading.value
            ? Loader().show()
            : OutlineBoxManager(
                onTap: () {
                  Get.to(() => AddNewMenu());
                },
                text: "Add New Menu",
                color: ColorManager.primary,
                fontFamily: true))
      ]),
    )));
  }
}
