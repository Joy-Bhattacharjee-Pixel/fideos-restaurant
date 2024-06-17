import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fideos_restaurant/service.dart';

class Restaurant {
  Delivery? delivery;
  String? website;
  bool? verified;
  String? description;
  Pickup? pickup;
  List<String>? type;
  String? password;
  List<String>? servings;
  String? phone;
  String? name;
  String? logo;
  OpeningHours? openingHours;
  String? id;
  String? email;
  String? status;

  Restaurant(
      {this.delivery,
      this.website,
      this.verified,
      this.description,
      this.pickup,
      this.type,
      this.password,
      this.servings,
      this.phone,
      this.name,
      this.logo,
      this.openingHours,
      this.id,
      this.email,
      this.status});

  Restaurant.fromJson(Map<String, dynamic> json) {
    delivery =
        json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
    website = json['website'];
    verified = json['verified'];
    description = json['description'];
    pickup = json['pickup'] != null ? Pickup.fromJson(json['pickup']) : null;
    type = json['type'].cast<String>();
    password = json['password'];
    servings = json['servings'].cast<String>();
    phone = json['phone'];
    name = json['name'];
    logo = json['logo'];
    openingHours = json['openingHours'] != null
        ? OpeningHours.fromJson(json['openingHours'])
        : null;
    id = json['id'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (delivery != null) {
      data['delivery'] = delivery!.toJson();
    }
    data['website'] = website;
    data['verified'] = verified;
    data['description'] = description;
    if (pickup != null) {
      data['pickup'] = pickup!.toJson();
    }
    data['type'] = type;
    data['password'] = password;
    data['servings'] = servings;
    data['phone'] = phone;
    data['name'] = name;
    data['logo'] = logo;
    if (openingHours != null) {
      data['openingHours'] = openingHours!.toJson();
    }
    data['id'] = id;
    data['email'] = email;
    data['status'] = status;
    return data;
  }

  // Login function for reastaurant
  login() async {
    try {
      // Preparinng body object for login
      final body = {"email": email, "password": password};

      // Preparing endpoint
      const endpoint = "/restaurants/login";

      // Fetching resposne
      final response = await APIClient().post(endpoint, data: body);
      // log(response.data["restaurant"]["id"].toString());

      // Resturning response
      return {
        "success": Restaurant.fromJson(response.data["restaurant"]),
        "token": response.data["token"]
      };
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
    // return {};
  }

  // forgot password function for reastaurant
  forgotpassword() async {
    try {
      // Preparinng body object for login
      final body = {"email": email};
      // Preparing endpoint
      const endpoint = "/restaurants/forgotPassword";
      // Fetching resposne
      final response = await APIClient().post(endpoint, data: body);
      // response
      return {
        "success": {"id": response.data["id"], "otp": response.data["otp"]}
      };
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }

  // Verify otp function for restaurant
  verifyOtp({required String otp, required String enteredOtp}) async {
    try {
      if (otp == enteredOtp) {
        return {"success": "OTP matched successfully"};
      } else {
        return {"error": "OTP does not match"};
      }
    } catch (e) {
      return {"error": e.toString()};
    }
  }

// Reset password function for restaurant
  resetPassword({required String password, required String id}) async {
    try {
      // Preparinng body object for login
      final body = {"password": password, "id": id};
        // Preparinng end point
      const endpoint = "/restaurants/reset-password";
      // Fetching resposne
      final Response response = await APIClient().post(endpoint, data: body);
    //  If response success
      return {"success": response.data["success"]};
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}

class Delivery {
  String? estimatedTime;
  double? fee;
  bool? available;
  int? minOrder;

  Delivery({this.estimatedTime, this.fee, this.available, this.minOrder});

  Delivery.fromJson(Map<String, dynamic> json) {
    estimatedTime = json['estimatedTime'];
    fee = json['fee'];
    available = json['available'];
    minOrder = json['minOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['estimatedTime'] = estimatedTime;
    data['fee'] = fee;
    data['available'] = available;
    data['minOrder'] = minOrder;
    return data;
  }
}

class Pickup {
  String? estimatedTime;
  bool? available;

  Pickup({this.estimatedTime, this.available});

  Pickup.fromJson(Map<String, dynamic> json) {
    estimatedTime = json['estimatedTime'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['estimatedTime'] = estimatedTime;
    data['available'] = available;
    return data;
  }
}

class OpeningHours {
  String? sunday;
  String? saturday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? monday;

  OpeningHours(
      {this.sunday,
      this.saturday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.monday});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'];
    saturday = json['saturday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    monday = json['monday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sunday'] = sunday;
    data['saturday'] = saturday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['monday'] = monday;
    return data;
  }
}
