import 'package:fideos_restaurant/controllers/food.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/food/add.dart';
import 'package:fideos_restaurant/presentations/food/food.details.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // Importing food controller
  final _controller = Get.put(FoodController());

  @override
  void initState() {
    super.initState();

    _allFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // Title
        const Text("Domino's Pizza",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.bold)),

        // Sub title
        const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(fontSize: 13, color: Colors.black)),

        // Add food button
        ButtonManager(onPressed: () { 
          Get.to(() => const AddFoodScreen());
        }, text: "Add Food").outline(),

        // Adding some space
        const SizedBox(height: 10),

        // All product list
        Obx(() => _controller.foodLoading.value
            ? Center(child: Loader().show())
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          _controller.foods.length,
                          (index) => GestureDetector(
                              onTap: () {
                                Get.to(() => const FoodDetails());
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.2))),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //  Product image
                                        SizedBox(
                                            height: 120,
                                            width: 95,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                    _controller.foods[index].image
                                                        .toString(),
                                                    fit: BoxFit.cover))),
                  
                                        // Giving some space
                                        const SizedBox(width: 7),
                  
                                        // Product details
                                        Expanded(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Product name
                                                      Text(
                                                          _controller
                                                              .foods[index].name
                                                              .toString(),
                                                          softWrap: true,
                                                          style: const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.black)),
                  
                                                      // Giving some space
                                                      const SizedBox(width: 20),
                  
                                                      // Best seller tag
                                                      Text("Best Seller",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: ColorManager
                                                                  .primary))
                                                    ]),
                  
                                                // Food description
                                                SizedBox(
                                                    width: Get.width * 0.65,
                                                    child: Text(
                                                        _controller.foods[index]
                                                            .description
                                                            .toString(),
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black87))),
                  
                                                // Giving some space
                                                const SizedBox(height: 3),
                  
                                                // Restuarant  name
                                                const Text("Kolkata Biryani",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 12.5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                  
                                                // Giving some space
                                                const SizedBox(height: 3),
                  
                                                // Food price
                                                Row(children: [
                                                  // Discounted price
                                                  Text("\$${_controller.foods[index].price}",
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: ColorManager
                                                              .black)),
                  
                                                  // Giving some space
                                                  const SizedBox(width: 5),
                  
                                                  // Original price
                                                  const Text("\$300",
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.black))
                                                ])
                                              ]),
                                        )
                                      ]))))),
                )))
      ]),
    );
  }

  _allFoods() {
    _controller.allFoods();
  }
}
