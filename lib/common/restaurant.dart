class MenuSummary {
  int id;
  String name;
  int price;
  String imgUrl;

  List<Map<String, MenuDetail>> options;

  MenuSummary({this.id, this.name, this.price});
}

class MenuDetail {
  int optionId;
  String optionName;
  int price;
}

class Restaurant {
  int id;

  String title;
  List<MenuSummary> menus;
  Map<int, bool> tables;

  Restaurant({this.id, this.title, this.menus});

  factory Restaurant.fromHost(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      title: json['title'],
      menus: json['foods'],
    );
  }
}

class Order {
  int orderId;
  int restaurantId;

  int tableIndex;

  Map<MenuSummary, int> foods;
}

// Future<Restaurant> getRestaurant(int resId, int tableId) async{
//   final String;
//   return

// }
