import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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

      // All new menu list
      ...List.generate(
          2,
          (index) => Column(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, bottom: 8),
                    child: Column(children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Veg Items",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),

                            // Item id

                            Text("Id:1234",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ]),

                      // Adding some space
                      const SizedBox(height: 2),

                      //  Available total food
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const Text("10 food items available in this menu",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                            index != 1
                                ? const Text("Enable",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13))
                                : Text("Disabled",
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13))
                          ])
                    ])),

                // Divider
                Divider(color: Colors.grey.withOpacity(0.2)),
              ])),

      // Add new menu button
      OutlineBoxManager(
          text: "Add New Menu", color: ColorManager.primary, fontFamily: true)
    ])));
  }
}
