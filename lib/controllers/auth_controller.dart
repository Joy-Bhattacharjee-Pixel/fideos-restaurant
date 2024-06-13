import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  // Email text field controller for login screen
  final TextEditingController loginEmailController = TextEditingController();

  // Password text field controller for login screen
  final TextEditingController loginPasswordController = TextEditingController();

  // Email text field controller for login screen
  final TextEditingController regEmailController = TextEditingController();

  // Password text field controller for login screen
  final TextEditingController regPasswordController = TextEditingController();

  


  // Login form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Register form key 
  final GlobalKey<FormState> registerFormKey =  GlobalKey<FormState>();

  
}