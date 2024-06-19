import 'dart:developer';
import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/separator.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Importing aut controller
  final _controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Form(
            key: _controller.registerFormKey,
            child: SingleChildScrollView(
              child: Column(children: [
                // Image
                const Image(image: AssetImage("assets/auth_screen.png")),

                // Adding some space
                const SizedBox(height: 10),

                // Title for restaurat
                const Text("India’s #1 Food Video and Delivery App",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),

                // Adding some space
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Seperator for title
                      Seperator(text: "Sign up", horizontalPadding: 0).show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurat name text field
                      TextFieldService(
                              controller: _controller.regNameController,
                              hint: "Restaurant Name")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurat name text field
                      TextFieldService(
                              controller: _controller.regEmailController,
                              hint: "Restaurant Email")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurat name text field
                      TextFieldService(
                              controller: _controller.regPhoneController,
                              hint: "Restaurant Phone")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurat name text field
                      TextFieldService(
                              controller: _controller.regPasswordController,
                              hint: "Password")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurat name text field
                      TextFieldService(
                              controller:
                                  _controller.regConfirmPasswordController,
                              hint: "Confirm Password")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Seperator for title
                      Seperator(
                              text: "Enter Address Manually",
                              horizontalPadding: 0)
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Full address field
                      TextFieldService(
                              controller: _controller.regFullAddressController,
                              hint: "Full Address")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // City field
                      TextFieldService(
                              controller: _controller.regCityController,
                              hint: "City")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // State field
                      TextFieldService(
                              controller: _controller.regStateController,
                              hint: "State")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // State field
                      TextFieldService(
                              controller: _controller.regCountryController,
                              hint: "Country")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),
                      // State field
                      TextFieldService(
                              controller: _controller.regPincodeController,
                              hint: "Pin Code")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Food type title seperator
                      Seperator(text: "Servings", horizontalPadding: 0).show(),

                      // Adding some space
                      const SizedBox(height: 15),
                      Obx(() => _controller.servings.isEmpty
                          ? TextFieldService(
                                  controller: _controller.regServingController,
                                  hint: "Serving")
                              .show()
                          : Column(
                              children: [
                                ...List.generate(
                                    _controller.servings.length,
                                    (index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextFieldService(
                                                controller: _controller
                                                    .servings[index]
                                                    .servingController,
                                                suffix: _controller
                                                            .servings.length ==
                                                        1
                                                    ? null
                                                    : Icons.close,
                                                onTapSuffix: () {
                                                  setState(() {
                                                    _controller
                                                        .removeServings(index);
                                                  });
                                                  log(_controller
                                                      .servings.length
                                                      .toString());
                                                },
                                                hint: "Serving")
                                            .show())),
                              ],
                            )),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Add button
                      Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _controller.addServings;
                                });
                                log(_controller.servings.length.toString());
                              },
                              child: const Icon(Icons.add))),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Food type title seperator
                      Seperator(text: "Food Type", horizontalPadding: 0).show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Food type list = radio button
                      Column(
                        children: List.generate(
                            3,
                            (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.selectedFood.value =
                                        _controller.foodType[index];
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: _controller
                                                        .selectedFood.value ==
                                                    _controller.foodType[index]
                                                ? ColorManager.primary
                                                : ColorManager.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Food type
                                          Text(_controller.foodType[index],
                                              style: TextStyle(
                                                  color: _controller
                                                              .selectedFood
                                                              .value ==
                                                          _controller
                                                              .foodType[index]
                                                      ? ColorManager.primary
                                                      : ColorManager.grey)),

                                          // Food type selection radio button
                                          Radio(
                                              value:
                                                  _controller.foodType[index],
                                              groupValue: _controller
                                                  .selectedFood.value,
                                              onChanged: (value) {
                                                setState(() {
                                                  _controller.selectedFood
                                                      .value = value.toString();
                                                  log(_controller
                                                      .selectedFood.value);
                                                });
                                              })
                                        ])))),
                      ),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Restaurant timing title seperator
                      Seperator(text: "Restaurant Timing", horizontalPadding: 0)
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Restaurant open time field
                      TextFieldService(
                              controller: _controller.regOpenTimeController,
                              hint: "Restaurant Open Time")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 10),

                      // Restaurant close time field
                      TextFieldService(
                              controller: _controller.regCloseTimeController,
                              hint: "Restaurant Close Time")
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // Open days title seperator
                      Seperator(
                              text: "Restaurant Open Days",
                              horizontalPadding: 0)
                          .show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      // List of  days  for restaurat open days selection
                      SizedBox(
                          width: Get.width,
                          height: 30,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(width: 10),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      if (_controller.selectedDays.contains(
                                          _controller.weekDays[index])) {
                                        _controller.selectedDays.remove(
                                            _controller.weekDays[index]);
                                      } else {
                                        _controller.selectedDays
                                            .add(_controller.weekDays[index]);
                                      }
                                    },
                                    child: Obx(() => Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: ColorManager.white,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color:
                                                    _controller.selectedDays.contains(_controller.weekDays[index])
                                                        ? ColorManager.primary
                                                        : ColorManager.grey)),
                                        child: Text(_controller.weekDays[index],
                                            textAlign: TextAlign.justify,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Lexend",
                                                color: _controller.selectedDays
                                                        .contains(
                                                            _controller.weekDays[index])
                                                    ? ColorManager.primary
                                                    : ColorManager.black)))));
                              })),
                      // Adding some space
                      const SizedBox(height: 15),

                      // Food type title seperator
                      Seperator(text: "Delivery", horizontalPadding: 0).show(),

                      // Adding some space
                      const SizedBox(height: 15),

                      //  Delivery switch button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Delivery",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                            CupertinoSwitch(
                                activeColor: ColorManager.primary,
                                value: _controller.deliverySwitch.value,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.deliverySwitch.value = value;
                                  });
                                })
                          ]),

                      //  When switch value is on
                      _controller.deliverySwitch.value
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 10),
                              child: Column(children: [
                                // Delivery fee field
                                TextFieldService(
                                        controller:
                                            _controller.deliveryfeeController,
                                        hint: "Delivery fee")
                                    .show(),

                                // Adding some space
                                const SizedBox(height: 10),

                                // Minimum order  field
                                TextFieldService(
                                        controller:
                                            _controller.minimumorderController,
                                        hint: "Minimum order")
                                    .show(),

                                // Adding some space
                                const SizedBox(height: 10),

                                // Estimated Time  field
                                TextFieldService(
                                        controller: _controller
                                            .deliveryEstimatedtimeController,
                                        hint: "Estimated Time")
                                    .show()
                              ]))
                          :
                          //  when switch value is of
                          const SizedBox(),

                      // Pick up switch button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Pick Up",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                            CupertinoSwitch(
                                activeColor: ColorManager.primary,
                                value: _controller.pickUpSwitch.value,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.pickUpSwitch.value = value;
                                  });
                                })
                          ]),

                      // If pick up is enable then show estimated time text field
                      _controller.pickUpSwitch.value == true
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFieldService(
                                      controller: _controller
                                          .pickupEstimatedtimeController,
                                      hint: "Estimated Time")
                                  .show(),
                            )
                          : const SizedBox(),

                      // Adding some space
                      const SizedBox(
                        height: 20,
                      ),

                      // Register button
                      ButtonManager(onPressed: () {}, text: "Register")
                          .elevated(),

                      // Adding some space
                      const SizedBox(height: 30),

                      // putting divider section
                      Seperator(text: "or").show(),

                      // give space
                      const SizedBox(height: 15),

                      // register option
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13.5)),
                            // give space
                            const SizedBox(width: 5),
                            InkWell(
                                onTap: () =>
                                    Get.to(() => const RegisterScreen()),
                                child: Text("Log In Now",
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold)))
                          ]),

                      // give space
                      const SizedBox(height: 30),

                      //  continuing agree text
                      const Text("By continuing, you agree to our",
                          style: TextStyle(fontSize: 13)),

                      // give space
                      const SizedBox(height: 6),

                      // terms and conditions Options list
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _controller.termsconditionoptions
                              .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  child: Text(e,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: ColorManager.primary))))
                              .toList())
                    ],
                  ),
                )
              ]),
            )));
  }
}
