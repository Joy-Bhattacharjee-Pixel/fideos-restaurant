import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/order/order.details.screen.dart';
import 'package:fideos_restaurant/presentations/order/rejection.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      // Product title
      const Text("Domino's Pizza",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black)),

      // Sub title
      const Text("Saltlake Sector 3, Bidhannagar, Kolkata",
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(fontSize: 13, color: Colors.black)),

      // Adding some space
      const SizedBox(height: 20),

      // All order list
      Expanded(
          child: ListView(
              children: List.generate(
                  6,
                  (index) => GestureDetector(
                      onTap: () {
                        Get.to(() => const OrderDetails());
                      },
                      child: Container(
                          // Padding for the container
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),

                          // Margin for the container
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),

                          // Decocation of container
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),

                          // Child widget for the container
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Order id
                                const Text("Order-123456",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.black)),

                                // Restuarant outlet
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Order outlet location
                                      const Text("From Domino's Pizza, Kolkata",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black)),

                                      // Order status
                                      GestureDetector(
                                          onTap: () {
                                            index % 2 != 0
                                                ? Get.dialog(
                                                    barrierDismissible: false,
                                                    rejectDialog)
                                                : const SizedBox();
                                          },
                                          child: Container(
                                              width: Get.width * 0.2,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                  index % 2 != 0
                                                      ? "Reject"
                                                      : "Confirm",
                                                  style: TextStyle(
                                                      color: index % 2 != 0
                                                          ? Colors.red
                                                          : Colors.green))))
                                    ]),

                                // Ordered items
                                const Text(
                                    "Kadai Panner, Chicken Biriyani and..",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13)),

                                // Giving some space
                                const SizedBox(height: 5),

                                // Ordered date
                                const Text("Ordered On 6.08 p.m.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13)),

                                // Giving some space
                                const SizedBox(height: 3),

                                // Delivery partner status
                                Text("Delivery Partner not assigned",
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ]))))))
    ])));
  }

  // Reject dialog
  Widget get rejectDialog => SimpleDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.all(10),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          // Reject title
          title: const Text("Are you sure to reject Order-1234567?",
              style: TextStyle(color: Colors.black, fontSize: 14)),

          // Padding for title
          titlePadding: const EdgeInsets.only(left: 40, right: 40, top: 15),

          // Shape of dialog
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          // Children of dialog container
          children: [
            // Reject description
            const Text(
                "This will require to submit a proper reject reason and if the reason does not stand back you will face a penalty according to the order value.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 12)),

            // back to order button
            _unConstrainBox(
                text: "Go Back to Order",
                color: Colors.green,
                width: Get.width * 0.5,
                onTap: () {
                  Get.back();
                }),

            // reject button
            _unConstrainBox(
                text: "I have Understand & Reject this Order",
                color: ColorManager.primary,
                width: Get.width * 0.8,
                onTap: () {
                  Get.back();
                  Get.to(() => const RejectionScreen());
                })
          ]);

  // unconstrain box
  Widget _unConstrainBox(
          {required String text,
          Color? color,
          double? width,
          required Function onTap}) =>
      GestureDetector(
          onTap: () {
            onTap();
          },
          child: UnconstrainedBox(
              child: Container(
                  width: width ?? Get.width * 0.4,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: color ?? Colors.grey)),
                  child:
                      // arrival time text
                      Text(text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color ?? Colors.black,
                              fontWeight: FontWeight.normal)))));
}
