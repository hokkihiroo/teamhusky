import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamhusky/car/team1/team1_view.dart';

class Car extends StatelessWidget {
  final name ;
  const Car({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FirstSystem(name: name,)),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    Text('1팀 HMT',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    Image.asset(
                      'asset/img/ddo.png',
                      width: 160,
                      height: 160,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('2팀 제네시스',
                    style: TextStyle(
                      letterSpacing: 3.0,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  Image.asset(
                    'asset/img/2323.png',
                    width: 160,
                    height: 160,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
