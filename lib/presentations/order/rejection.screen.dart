import 'package:fideos_restaurant/models/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RejectionScreen extends StatefulWidget {
  const RejectionScreen({super.key});

  @override
  State<RejectionScreen> createState() => _RejectionScreenState();
}

class _RejectionScreenState extends State<RejectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      // Top section
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            // Back button
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset("assets/back_image.png", height: 20)),

            // Giving some space
            const Spacer(),

            Column(children: [
              const Text("Reject Order-123456",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                      
              Text("Please provide a proper reason to reject order ",
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.withOpacity(0.8)))
            ]),
            const Spacer()
          ])),

      // Divider
      Divider(color: Colors.grey.withOpacity(0.2)),

      //Rejection reason field
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
          child: TextField(
              // Controller: controller.rejectionController,
              maxLines: 8,
              decoration: InputDecoration(
                  hintText: "Provide detailed reason to reject this order",
                  hintStyle: TextStyle(fontSize: 13, color: Colors.black),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26))))),

      // Giving some space
      const SizedBox(height: 10),

      // Submit button
      UnconstrainedBox(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: const Text("Submit",
                  softWrap: true,
                  style: TextStyle(fontSize: 15, color: Colors.white))))
    ]));
  }
}
