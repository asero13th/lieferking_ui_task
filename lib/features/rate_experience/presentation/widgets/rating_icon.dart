import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {

 final int deliverySpeed;
  final int foodQuality;
  final int friendliness;
  final ValueChanged<int> onDeliverySpeedChanged;
  final ValueChanged<int> onFoodQualityChanged;
  final ValueChanged<int> onFriendlinessChanged;

  const RatingSection({
    Key? key,
    required this.deliverySpeed,
    required this.foodQuality,
    required this.friendliness,
    required this.onDeliverySpeedChanged,
    required this.onFoodQualityChanged,
    required this.onFriendlinessChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RatingRow(label: 'Delivery Speed ⚡️'),
        SizedBox(
          height: 16,
        ),
        RatingRow(label: 'Quality 🍕'),
        SizedBox(
          height: 16,
        ),
        RatingRow(label: 'Friendliness 🤩'),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class RatingRow extends StatefulWidget {
  final String label;

  const RatingRow({required this.label});

  @override
  _RatingRowState createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  int _selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Row(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedStars = index + 1;
                });
              },
              child: Icon(
                Icons.star,
                color: index < _selectedStars ? Colors.orange : Colors.grey,
                size: 32,
              ),
            );
          }),
        ),
      ],
    );
  }
}
