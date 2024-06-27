import 'package:dio/dio.dart';
import 'package:fideos_restaurant/service.dart';

class Restaurant {
  String? id;
  String? status;
  bool? verified;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? website;
  String? logo;
  String? description;
  Address? address;
  dynamic type;
  List<String>? servings;
  Timing? timing;
  List<String>? openingDays;
  Delivery? delivery;
  Pickup? pickup;

  Restaurant(
      {this.id,
      this.status,
      this.verified,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.website,
      this.logo,
      this.description,
      this.address,
      this.type,
      this.servings,
      this.timing,
      this.openingDays,
      this.delivery,
      this.pickup});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    verified = json['verified'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    website = json['website'];
    logo = json['logo'];
    description = json['description'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    type = json['type'];
    servings = json['servings'].cast<String>();
    timing = json['timing'] != null ? Timing.fromJson(json['timing']) : null;
    openingDays = json['openingDays'].cast<String>();
    delivery =
        json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
    pickup = json['pickup'] != null ? Pickup.fromJson(json['pickup']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['verified'] = verified;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['website'] = website;
    data['logo'] = logo;
    data['description'] = description;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['type'] = type;
    data['servings'] = servings;
    if (timing != null) {
      data['timing'] = timing!.toJson();
    }
    data['openingDays'] = openingDays;
    if (delivery != null) {
      data['delivery'] = delivery!.toJson();
    }
    if (pickup != null) {
      data['pickup'] = pickup!.toJson();
    }
    return data;
  }

  // Login function for reastaurant
  login() async {
    try {
      // Preparing body object for login
      final body = {"email": email, "password": password};

      // Preparing endpoint
      const endpoint = "/restaurants/login";

      // Fetching resposne
      final response = await APIClient().post(endpoint, data: body);

      // Returning response
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

  // Create restaurant function
  Future<Map<String, dynamic>> create() async {
    try {
      const String endpoint = "/restaurants/create";

      final Map<String, dynamic> body = {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "website": website,
        "description": description,
        "address": address!.toJson(),
        "type": type,
        "servings": servings,
        "timing": timing!.toJson(),
        "openingDays": openingDays,
        "delivery": delivery!.toJson(),
        "pickup": pickup!.toJson()
      };

      final response = await APIClient().post(endpoint, data: body);

      return {
        "success": response.data["restaurant"],
        "otp": response.data["otp_verification"]
      };
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }

  // Verify email function
  Future<Map<String, dynamic>> verifyEmail(
      {required String otp, required String encryptedOtp}) async {
    // Trying to verify email
    try {
      // Preparing endpoint
      const endpoint = "/restaurants/verify-otp";

      // Preparing body
      final body = {"otp": otp, "data": encryptedOtp};

      // Fetching response
      final response = await APIClient().put(endpoint, data: body);

      return {
        "success": response.data["restaurant"],
      };
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }

// Resutaurant details
  restaurantDetails({required String id}) async {
    try {
      // Preparing end point
      const endpoint = "/restaurants/details";

      // Preparing query parameters
      final params = {"id": id};

      // Fetching response
      final response = await APIClient().get(endpoint, queryParameters: params);

      // Returning response as success
      return {
        "success": response.data["restaurant"],
      };
      // Returning response as failed
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }


}

class Address {
  String? fullAddress;
  String? city;
  String? state;
  String? country;
  dynamic pincode;

  Address(
      {this.fullAddress, this.city, this.state, this.country, this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'];
    city = json['city'];
    state = json['state'];
    country = json['Country'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullAddress'] = fullAddress;
    data['city'] = city;
    data['state'] = state;
    data['Country'] = country;
    data['Pincode'] = pincode;
    return data;
  }
}

class Timing {
  String? openingTime;
  String? closingTime;

  Timing({this.openingTime, this.closingTime});

  Timing.fromJson(Map<String, dynamic> json) {
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['openingTime'] = openingTime;
    data['closingTime'] = closingTime;
    return data;
  }
}

class Delivery {
  bool? available;
  double? fee;
  int? minOrder;
  String? estimatedTime;

  Delivery({this.available, this.fee, this.minOrder, this.estimatedTime});

  Delivery.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    fee = json['fee'];
    minOrder = json['minOrder'];
    estimatedTime = json['estimatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available'] = available;
    data['fee'] = fee;
    data['minOrder'] = minOrder;
    data['estimatedTime'] = estimatedTime;
    return data;
  }
}

class Pickup {
  bool? available;
  String? estimatedTime;

  Pickup({this.available, this.estimatedTime});

  Pickup.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    estimatedTime = json['estimatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available'] = available;
    data['estimatedTime'] = estimatedTime;
    return data;
  }
}
