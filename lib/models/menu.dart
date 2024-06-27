import 'package:dio/dio.dart';
import 'package:fideos_restaurant/service.dart';

class Menu {
  String? name;
  String? description;
  String? id;
  String? status;

  Menu({this.name, this.description, this.id, this.status});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    data['status'] = status;
    return data;
  }

  // Add menu function
  addmenu({ required String id}) async {
    try {
      const String endpoint = "/menus/create";

      final  body = {
        "restaurantId": id,
        "name": name,
        "description": description,
      };

      final response = await APIClient().post(endpoint, data: body);

      return {"success": response.data["menu"]};
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }

// Fetch Menu
  fetchmenu({required String restaurantId}) async {
    try {
      // Preparing end point
      const endpoint = "/menus/all";

      // Preparing query parameters
      final params = {"restaurantId": restaurantId};

      // Fetching response
      final response = await APIClient().get(endpoint, queryParameters: params);
      // returning response as success
      // return {"success": response.data["menus"]};

       // separate menus from response
      List<dynamic> menus = response.data['menus'];

      // parse this list of menus from map to food and return
      return {"success": menus.map((menu) => Menu.fromJson(menu)).toList()};
      
      // returning response as failed
    } on DioException catch (e) {
      return {"error": e.response!.data["error"]};
    }
  }
}
