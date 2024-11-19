class UserRating {
  final int deliverySpeed;
  final int foodQuality;
  final int friendliness;
  final String feedback;

  UserRating({
    required this.deliverySpeed,
    required this.foodQuality,
    required this.friendliness,
    required this.feedback,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) {
    return UserRating(
      deliverySpeed: json['delivery_speed'],
      foodQuality: json['food_quality'],
      friendliness: json['friendliness'],
      feedback: json['feedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_speed': deliverySpeed,
      'food_quality': foodQuality,
      'friendliness': friendliness,
      'feedback': feedback,
    };
  }
}
