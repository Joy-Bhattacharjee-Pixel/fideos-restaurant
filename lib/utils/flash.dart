import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashManager {
  show(String message) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
}
