import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      // Title
      const Text("Domino's Pizza",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold)),


      // Sub title
      const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(fontSize: 13, color: Colors.black)),

      // Add product button
      OutlineBoxManager(
          text: "Add Product",
          color: ColorManager.primary,
          width: Get.width * 0.7,
          fontFamily: true),

      // All product list
      Expanded(
          child: ListView(
              children: List.generate(
                  6,
                  (index) => GestureDetector(
                      onTap: () {
                        // Get.to(() => const EditProdut());
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          child: Row(children: [
                            //  Product image
                            SizedBox(
                                height: 120,
                                width: 95,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                        "assets/delicious-pizza.png",
                                        fit: BoxFit.fitHeight))),

                            // Giving some space
                            const SizedBox(width: 7),

                            // Product details
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Product name
                                        const Text("Special Chicken Biryani",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),

                                        // Giving some space
                                        const SizedBox(width: 20),

                                        // Best seller tag
                                        Text("Best Seller",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: ColorManager.primary))
                                      ]),

                                  // Product description
                                  SizedBox(
                                      width: Get.width * 0.65,
                                      child: const Text(
                                          "Kadai Paneer islls warming ssg mkdm dish...",
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87))),

                                  // Giving some space
                                  const SizedBox(height: 3),

                                  // Restuarant  name
                                  const Text("Kolkata Biryani",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),

                                  // Giving some space
                                  const SizedBox(height: 3),

                                  // Product price
                                  Row(children: [

                                    // Discounted price
                                    Text("\$200",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.black)),

                                    // Giving some space
                                    const SizedBox(width: 5),

                                    // Original price
                                    const Text("\$300",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.black))
                                  ])
                                ])
                          ]))))))
    ])));
  }
}
