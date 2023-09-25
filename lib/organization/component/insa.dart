import 'package:flutter/material.dart';

class Insa extends StatelessWidget {
  final String name;
  final String team;
  final String image;

  const Insa({super.key, required this.name, required this.team, required this.image});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Image.asset(
        image,
      width: 200  ,
      height: 200,),
      content: Column(
        children: [
          Text('이름: $name'),
          Text('소속팀 :$team'),
          Text('직책 : 대표이사'),
          Text('사는곳 : 전라남도 해남군 땅끝마을 '),
          Text('생년월일 : 1990 1월 1일'),
          Text('키 : 168'),
          Text('몸무게  : 58'),
          Text('차량 : 12가 3434'),


        ],
      ),
      actions: [
        TextButton(
          child: const Text('확인'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
