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
    menu = json['menu'] != null ?  Menu.fromJson(json['menu']) : null;
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
  allFoods({ required String restaurantId}) async{
    // Preparing endpoint 
    const endpoint  = "/foods/all"; 

    // Preparing query params
    final queryParams = { "restaurantId": restaurantId };
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
