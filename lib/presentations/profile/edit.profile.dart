
import 'package:fideos_restaurant/controllers/restaurant.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  // Importing Restaurant controller
  final _controller = Get.put(RestaurantController());

  @override
  void initState() {
    super.initState();
    _controller.fetchDetails();

    if (_controller.restaurantDetailsProcessing.value) {
      _controller.editNameController.text =
          _controller.restaurantData.value.name.toString();
      _controller.editPhoneController.text =
          _controller.restaurantData.value.phone.toString();
      _controller.editAddressController.text =
          _controller.restaurantData.value.address!.fullAddress.toString() ;
  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                CircleAvatar(
                    backgroundColor: ColorManager.primary,
                    radius: 50,
                    child: CircleAvatar(
                        radius: 48,
                        backgroundColor: ColorManager.white,
                        child:
                            const Image(image: AssetImage("assets/man.png")))),

                // Adding some space
                const SizedBox(height: 50),

                // Name field
                TextFieldService(
                        controller: _controller.editNameController,
                        validator: (name) =>
                            _validator(value: name, fieldName: "Name"),
                        hint: "Name")
                    .show(),

                // Phone field
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFieldService(
                            controller: _controller.editPhoneController,
                            validator: (phone) =>
                                _validator(value: phone, fieldName: "Phone"),
                            hint: "Phone")
                        .show()),

                // Addresss field
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFieldService(
                            controller: _controller.editAddressController,
                            validator: (address) => _validator(
                                value: address, fieldName: "Address"),
                            hint: "Address")
                        .show()),

                // Time field
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFieldService(
                            controller: TextEditingController(),
                            validator: (time) =>
                                _validator(value: time, fieldName: "Timing"),
                            hint: "Timing")
                        .show()),

                // Adding some space
                const SizedBox(height: 20),

                // Submit account button
                ButtonManager(
                        onPressed: () {},
                        text: "Submit",
                        backgroundcolor: ColorManager.primary)
                    .outline(),
              ],
            ),
          ),
        )));
  }

  // Field validator
  _validator({String? value, String? fieldName}) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid $fieldName";
    }
  }
}
