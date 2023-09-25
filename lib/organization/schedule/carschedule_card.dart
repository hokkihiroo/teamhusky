import 'package:flutter/material.dart';

class CarScheduleCard extends StatelessWidget {
  final String time;
  final String name;

  const CarScheduleCard({super.key,  required this.time,  required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          ':',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
