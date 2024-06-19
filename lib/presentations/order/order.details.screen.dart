import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      // Back icon
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/back_image.png", height: 20)))),

      // Title
      const Text("Domino's Pizza",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black)),

      // Sub title

      const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(fontSize: 13, color: Colors.black)),

      // Order id
      OutlineBoxManager(
          text: "Order-1234567",
          width: Get.width * 0.5,
          opacity: 0.4,
          color: Colors.black),

      // Giving some space
      const SizedBox(height: 10),

      // Customer name
      const Text("Joy Bhattacherjee",
          softWrap: true,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),

      // Giving some space
      const SizedBox(height: 5),

      // Customer location
      const Text("DN-24, Saltlake, Sector 5, Kolkata",
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: Colors.black)),

      // Giving some space
      const SizedBox(height: 15),

      // Delivery partner status
      const Text("Delivery Partner Waiting",
          softWrap: true,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xff007713))),

      // Giving some space
      const SizedBox(height: 20),

      // Product list
      GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 5, right: 5),
          children: List.generate(
              3,
              (index) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Product id
                        Text("Product-12345",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),

                        // Product quantity
                        Text("Kadai Panner x 2",
                            softWrap: true,
                            style: TextStyle(fontSize: 11, color: Colors.black))
                      ])))),

      // Order ready tile
      OutlineBoxManager(
          text: "Food is Ready",
          width: Get.width * 0.5,
          color: const Color(0xff007713)),

      // Food preparation
      OutlineBoxManager(
          text: "Start Preparation",
          width: Get.width * 0.5,
          color: const Color(0xffA69500))
    ])));
  }
}
