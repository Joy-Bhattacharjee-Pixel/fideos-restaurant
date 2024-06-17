import 'dart:developer';

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
  List<String>? type;
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
    type = json['type'].cast<String>();
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

  // Register function
  register() async {
    // Trying to add restaurant
    try {
      // Preparing body object
      final body = {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "website": website,
        "description": description,
        "address": address,
        "type": type,
        "servings": servings,
        "timing": timing,
        "openingDays": openingDays,
        "delivery": delivery,
        "pickup": pickup
      };

      // Preparing endpoint
      const endpoint = "/restaurants/create";

      // Fetching response 
      final response = await APIClient().post(endpoint, data: body);

      
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
  int? pincode;

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

// class Restaurant {
//   Delivery? delivery;
//   String? website;
//   bool? verified;
//   String? description;
//   Pickup? pickup;
//   List<String>? type;
//   String? password;
//   List<String>? servings;
//   String? phone;
//   String? name;
//   String? logo;
//   OpeningHours? openingHours;
//   String? id;
//   String? email;
//   String? status;

//   Restaurant(
//       {delivery,
//       this.website,
//       this.verified,
//       this.description,
//       this.pickup,
//       this.type,
//       this.password,
//       this.servings,
//       this.phone,
//       this.name,
//       this.logo,
//       this.openingHours,
//       this.id,
//       this.email,
//       this.status});

//   Restaurant.fromJson(Map<String, dynamic> json) {
//     delivery =
//         json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
//     website = json['website'];
//     verified = json['verified'];
//     description = json['description'];
//     pickup = json['pickup'] != null ? Pickup.fromJson(json['pickup']) : null;
//     type = json['type'].cast<String>();
//     password = json['password'];
//     servings = json['servings'].cast<String>();
//     phone = json['phone'];
//     name = json['name'];
//     logo = json['logo'];
//     openingHours = json['openingHours'] != null
//         ? OpeningHours.fromJson(json['openingHours'])
//         : null;
//     id = json['id'];
//     email = json['email'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (delivery != null) {
//       data['delivery'] = delivery!.toJson();
//     }
//     data['website'] = website;
//     data['verified'] = verified;
//     data['description'] = description;
//     if (pickup != null) {
//       data['pickup'] = pickup!.toJson();
//     }
//     data['type'] = type;
//     data['password'] = password;
//     data['servings'] = servings;
//     data['phone'] = phone;
//     data['name'] = name;
//     data['logo'] = logo;
//     if (openingHours != null) {
//       data['openingHours'] = openingHours!.toJson();
//     }
//     data['id'] = id;
//     data['email'] = email;
//     data['status'] = status;
//     return data;
//   }

//   // Login function for reastaurant
//   login() async {
//     try {
//       // Preparing body object for login
//       final body = {"email": email, "password": password};

//       // Preparing endpoint
//       const endpoint = "/restaurants/login";

//       // Fetching resposne
//       final response = await APIClient().post(endpoint, data: body);

//       // Resturning response
//       return {
//         "success": Restaurant.fromJson(response.data["restaurant"]),
//         "token": response.data["token"]
//       };
//     } on DioException catch (e) {
//       return {"error": e.response!.data["error"]};
//     }
//     // return {};
//   }

//   // forgot password function for reastaurant
//   forgotpassword() async {
//     try {
//       // Preparinng body object for login
//       final body = {"email": email};
//       // Preparing endpoint
//       const endpoint = "/restaurants/forgotPassword";
//       // Fetching resposne
//       final response = await APIClient().post(endpoint, data: body);
//       // response
//       return {
//         "success": {"id": response.data["id"], "otp": response.data["otp"]}
//       };
//     } on DioException catch (e) {
//       return {"error": e.response!.data["error"]};
//     }
//   }

//   // Register function
//   register() async {
//     // Trying to add restaurant
//     try {

//     } on DioException catch (e) {
//       return {"error": e.response!.data["error"]};
//     }
//   }
// }

// class Delivery {
//   String? estimatedTime;
//   double? fee;
//   bool? available;
//   int? minOrder;

//   Delivery({this.estimatedTime, this.fee, this.available, this.minOrder});

//   Delivery.fromJson(Map<String, dynamic> json) {
//     estimatedTime = json['estimatedTime'];
//     fee = json['fee'];
//     available = json['available'];
//     minOrder = json['minOrder'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['estimatedTime'] = estimatedTime;
//     data['fee'] = fee;
//     data['available'] = available;
//     data['minOrder'] = minOrder;
//     return data;
//   }
// }

// class Pickup {
//   String? estimatedTime;
//   bool? available;

//   Pickup({this.estimatedTime, this.available});

//   Pickup.fromJson(Map<String, dynamic> json) {
//     estimatedTime = json['estimatedTime'];
//     available = json['available'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['estimatedTime'] = estimatedTime;
//     data['available'] = available;
//     return data;
//   }
// }

// class OpeningHours {
//   String? sunday;
//   String? saturday;
//   String? tuesday;
//   String? wednesday;
//   String? thursday;
//   String? friday;
//   String? monday;

//   OpeningHours(
//       {this.sunday,
//       this.saturday,
//       this.tuesday,
//       this.wednesday,
//       this.thursday,
//       this.friday,
//       this.monday});

//   OpeningHours.fromJson(Map<String, dynamic> json) {
//     sunday = json['sunday'];
//     saturday = json['saturday'];
//     tuesday = json['tuesday'];
//     wednesday = json['wednesday'];
//     thursday = json['thursday'];
//     friday = json['friday'];
//     monday = json['monday'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['sunday'] = sunday;
//     data['saturday'] = saturday;
//     data['tuesday'] = tuesday;
//     data['wednesday'] = wednesday;
//     data['thursday'] = thursday;
//     data['friday'] = friday;
//     data['monday'] = monday;
//     return data;
//   }
// }
