import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  // Email text field controller
  final TextEditingController loginEmailController = TextEditingController();

  // Password text field controller
  final TextEditingController loginPasswordController = TextEditingController();


  // Login form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  
}