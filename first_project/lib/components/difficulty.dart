import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int rate;

  const Difficulty(
      this.rate, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15, color: (rate >= 1) ? Colors.cyan : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (rate >= 2) ? Colors.cyan : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (rate >= 3) ? Colors.cyan : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (rate >= 4) ? Colors.cyan : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (rate >= 5) ? Colors.cyan : Colors.blue[100]),
      ],
    );
  }
}