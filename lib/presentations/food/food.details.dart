import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/outlinebox.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // Importing auth controller
  final _controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                // Back button
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/back_image.png", height: 20)),

                const Spacer(),

                Column(children: [
                  // Titte
                  const Text("Details of Product-123456",
                      style: TextStyle(
                        color: Colors.black,
                      )),

                  // Sub title
                  Text("You can edit or add new product here",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 11, color: Colors.grey.withOpacity(0.4)))
                ]),
                const Spacer()
              ])),

          // Divider
          Divider(color: Colors.grey.withOpacity(0.2)),

          // Product name field
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: TextFieldService(
                      controller: _controller.productNameController,
                      validator: (pName) =>
                          _validator(value: pName, fieldName: "Product Name"),
                      hint: "Enter Product Name")
                  .show()),

          // Product detailed reason to reject field
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: TextField(
                  controller: _controller.reasonRejectController,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: "Provide detailed reason to reject this order",
                      hintStyle: TextStyle(
                          fontSize: 13, color: Colors.grey.withOpacity(0.9)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26))))),

          // Tag tile list
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  height: 55,
                  width: Get.width,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(
                          6,
                          (index) => Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(7)),
                              child:
                                  // Product tag title
                                  const Text("Best Seller",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ))))))),

          // Add new tag field
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: TextFieldService(
                      controller: _controller.newTagController,
                      validator: (nTag) =>
                          _validator(value: nTag, fieldName: "New Tag"),
                      hint: "Add New Tag")
                  .show()),

          // Add new tag list
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  height: 55,
                  width: Get.width,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(
                          6,
                          (index) => Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(7)),
                              child:
                                  // Product tag title
                                  const Text("Biryani",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ))))))),

          // Add new menu field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: TextFieldService(
                    controller: _controller.newMenuController,
                    validator: (nMenu) =>
                        _validator(value: nMenu, fieldName: "New Menu"),
                    hint: "Add new menu")
                .show(),
          ),

          // Offer price field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: TextFieldService(
                    controller: _controller.offerPriceController,
                    validator: (oPrice) =>
                        _validator(value: oPrice, fieldName: "Offer Price"),
                    hint: "Offer Price")
                .show(),
          ),

          // Actual price field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: TextFieldService(
                    controller: _controller.actualPriceController,
                    validator: (aPrice) =>
                        _validator(value: aPrice, fieldName: "Actual Price"),
                    hint: "Actual Price")
                .show(),
          ),

          //Add image tile
          Align(
              alignment: Alignment.centerLeft,
              child: UnconstrainedBox(
                  child: Container(
                      width: Get.width * 0.3,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text("Add Image",
                          softWrap: true,
                          style: TextStyle(color: Colors.black))))),

          // Save button
          OutlineBoxManager(
              text: "Save", color: ColorManager.primary, fontFamily: true)
        ]),
      ),
    ));
  }

  // Field validator
  _validator({String? value, String? fieldName}) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid $fieldName";
    }
  }
}
