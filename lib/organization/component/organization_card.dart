import 'package:flutter/material.dart';

class OrganizationCard extends StatelessWidget {
  final Widget image;
  final String name;
  final String team;
  final String position;

  const OrganizationCard(
      {super.key,
      required this.position,
      required this.image,
      required this.name,
      required this.team});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        height: 70,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: image,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              team,
              style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              position,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
