const String host = "https://en.wikipedia.org/wiki/Main_Page";

class Food {
  int id;
  String name;
  int price;
  String imgUrl;

  Map<String, bool> options;
  Food({this.id ,this.name, this.price});
}

class Restaurant {
  int id;

  String title;
  List<Food> foods;
  Map<int, bool> tables;

  Restaurant({this.id, this.title, String foods}){
    

  }
  
  factory Restaurant.fromHost(Map<String, dynamic> json){
    return Restaurant(
      id: json['id'],
      title: json['title'],
      foods: json['foods'],
    );
  }
}

class Order{
  int orderId;
  int restaurantId;

  int tableIndex;

  Map<Food, int> foods;
}

// Future<Restaurant> getRestaurant(int resId, int tableId) async{
//   final String;
//   return 

// }
