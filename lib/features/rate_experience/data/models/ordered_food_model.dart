class OrderedFood {
  final String foodType;
  final String paymentMethod;
  final String orderId;
  final double totalPrice;
  final List<Food> foods;
  final String dateAndTime;

  OrderedFood({
    required this.foodType,
    required this.paymentMethod,
    required this.orderId,
    required this.totalPrice,
    required this.foods,
    required this.dateAndTime,
  });

  factory OrderedFood.fromJson(Map<String, dynamic> json) {
    return OrderedFood(
      foodType: json['foodype'],
      paymentMethod: json['payment_methode'],
      orderId: json['order_id'],
      totalPrice: json['total_price'],
      foods: List<Food>.from(json['foods'].map((food) => Food.fromJson(food))),
      dateAndTime: json['order_date_time'],
    );
  }
}

class Food {
  final int totalFoods;
  final String foodName;
  final String additionalPreference;

  Food({
    required this.totalFoods,
    required this.foodName,
    required this.additionalPreference,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      totalFoods: json['total_foods'],
      foodName: json['food_name'],
      additionalPreference: json['addictional_preference'],
    );
  }
}
