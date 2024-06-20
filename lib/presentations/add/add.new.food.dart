import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({super.key});

  @override
  State<AddNewFood> createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                    // Title
                    const Text("Domino's Pizza",
                        textAlign: TextAlign.center,
                        style: TextStyle(
              fontSize: 21,
              color: Colors.black,
                        )),
              
                    // Sub title
                    const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: 13, color: Colors.black)),
              
                    // Adding some space
                    const SizedBox(height: 15),
              
                    GestureDetector(
                        onTap: () {
              // Get.to(() => const EditProdut());
                        },
                        child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.2))),
                child: Row(children: [
                  //  Product image
                  SizedBox(
                      height: 120,
                      width: 95,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset("assets/delicious-pizza.png",
                              fit: BoxFit.fitHeight))),
              
                  // Adding some space
                  const SizedBox(width: 7),
              
                  // Product details
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name
                        const Text("Special Chicken Biryani",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
              
                        // Product description
                        SizedBox(
                            width: Get.width * 0.65,
                            child: const Text(
                                "Kadai Paneer islls warming ssg mkdm dish...",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87))),
              
                        // Product veg or non-veg
                        const Text("Category:Non-Veg Items",
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black87)),
              
                        // Adding some space
                        const SizedBox(height: 3),
              
                        // Product price
                        const Row(children: [
                          Text("Price: \$200",
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black)),
              
                          // Adding some space
                          SizedBox(width: 10),
              
                          // Mrp price
                          Text("MRP: \$300",
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black)),
                        ]),
              
                        // Adding some space
                        const SizedBox(height: 3),
              
                        // Tag best seller
                        const Text("Tag: Best Seller",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black))
                      ])
                ]))),
              
                    // Add new food button
                    OutlineBoxManager(
                        text: "Add New Food", color: ColorManager.primary, fontFamily: true)
                  ]),
            )));
  }
}
