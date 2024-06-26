import 'package:fideos_restaurant/controllers/restaurant.controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/profile/edit.profile.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Importing Restaurant controller
  final _controller = RestaurantController();

  @override
  void initState() {
    _controller.fetchDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Obx(() => _controller.restaurantDetailsProcessing.value
            ? Center(child: Loader().show())
            : Center(
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
                                      child: const Image(
                                          image:
                                              AssetImage("assets/man.png")))),

                        // Restaurant name
                        Text(
                            _controller.restaurantData.value.name.toString() ??
                                "Anamika Jha",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Lexend",
                                fontWeight: FontWeight.w500)),

                        // Restaurant email
                        Text(
                            _controller.restaurantData.value.email.toString() ??
                                "anamika@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15)),

                              // Adding some space
                              const SizedBox(height: 10),

                              // Edit profile button
                              SizedBox(
                                  width: 140,
                                  child: ButtonManager(
                                          onPressed: () {
                                            Get.to(() =>
                                               const  EditProfileScreen());
                                          },
                                          text: "Edit Profile")
                                      .elevated()),

                              // Adding some space
                              const SizedBox(height: 20),

                        // Restaurant detail = name
                        _detail(
                            icon: const Icon(Icons.person),
                            title: _controller.restaurantData.value.name
                                    ??
                                "Anamika Jha"),

                        // Restaurant detail = email
                        _detail(
                          icon: const Icon(Icons.mail),
                          title: _controller.restaurantData.value.email
                                   ??
                              "anamika@gmail.com",
                        ),

                              // Restaurant detail = phone
                              _detail(
                                  icon: const Icon(Icons.phone),
                                  title: _controller.restaurantData.value.phone
                                        ??
                                      "786678988"),

                              // Restaurant detail
                              _detail(
                                  icon: const Icon(Icons.logout),
                                  title: "Log Out"),

                              const SizedBox(height: 20),

                              // Delete my account button
                              ButtonManager(
                                      onPressed: () {},
                                      text: "Delete My Acount",
                                      backgroundcolor: ColorManager.primary)
                                  .outline()
                            ]))))));
  }

  // Restaurant detail lite
  _detail({Icon? icon, String? title}) => Column(children: [
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading: icon,
            iconColor: ColorManager.grey,
            title: Text(title.toString())),

        // Horizontal divider
        Divider(color: ColorManager.grey.withOpacity(0.07))
      ]);
}
