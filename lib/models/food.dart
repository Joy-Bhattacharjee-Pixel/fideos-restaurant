
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fideos_restaurant/service.dart';

class Food {
  String? image;
  String? price;
  String? name;
  String? description;
  String? id;
  String? availability;
  String? status;
  Menu? menu;

  Food(
      {this.image,
      this.price,
      this.name,
      this.description,
      this.id,
      this.availability,
      this.status,
      this.menu});

  Food.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    id = json['id'];
    availability = json['availability'];
    status = json['status'];
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] = image;
    data['price'] = price;
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    data['availability'] = availability;
    data['status'] = status;
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    return data;
  }

  // Fetch all foods
  allFoods({required String restaurantId}) async {
    try {
      // Preparing endpoint
      const endpoint = "/foods/all";

      // Preparing query params
      final queryParams = {"restaurantId": restaurantId};

      // Fetching all foods
      final response =
          await APIClient().get(endpoint, queryParameters: queryParams);

      // separate foods from response
      List<dynamic> foods = response.data['foods'];

      // parse this list of foods from map to food and return
      return {"success": foods.map((food) => Food.fromJson(food)).toList()};
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }

  // Add food function
  addFood({required String restaurantId}) async {
    // Trying to add food
    try {
      // Preparing endpoint
      const endpoint = "/foods/create";
      // Preparing body object
      final dio.FormData formData = dio.FormData.fromMap({
        "name": name,
        "description": description,
        "price": price,
        "menu": menu,
        "availability": availability,
        "restaurantId": restaurantId,
        "files": await dio.MultipartFile.fromFile(
          image ?? "",
          filename: "${DateTime.now().millisecondsSinceEpoch}.jpg",
        ),
      });

      Map<String, dynamic> body = {};

      for (var element in formData.fields) {
        body[element.key] = element.value;
      }

      // Fetching response
      final response = await APIClient().post(endpoint, data: formData);

      return {"success": response.data["success"]};
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }
}

class Menu {
  String? description;
  String? id;
  String? status;
  String? name;
  String? restaurantId;

  Menu({this.description, this.id, this.status, this.name, this.restaurantId});

  Menu.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    status = json['status'];
    name = json['name'];
    restaurantId = json['restaurantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['status'] = status;
    data['name'] = name;
    data['restaurantId'] = restaurantId;
    return data;
  }
}
