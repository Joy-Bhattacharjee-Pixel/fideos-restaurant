import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/base/base_screen.dart';
import 'package:fideos_restaurant/presentations/food/add.dart';
import 'package:fideos_restaurant/presentations/food/food.details.dart';
import 'package:fideos_restaurant/presentations/food/foods.dart';
import 'package:fideos_restaurant/presentations/menu/add.new.menu.dart';
import 'package:fideos_restaurant/presentations/profile/edit.profile.dart';
import 'package:fideos_restaurant/presentations/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fideos Restaurant App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
            useMaterial3: true,
            fontFamily: "Lexend",
            primaryColor: ColorManager.primary),
        home: const SplashScreen());
  }
}
