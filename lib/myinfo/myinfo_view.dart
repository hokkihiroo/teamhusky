import 'package:flutter/material.dart';
import 'package:teamhusky/user/view/user_auth.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 140,
              color: Colors.white,
              child: Text(
                '입차 수 : 10대',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '팀 : 1팀',
              style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '직책 : 팀원',
              style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '생년월일 : 1988.12.14',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '주소 : 서울 관악구 사당동',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '전화번호 : 010-4900-7942',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '차량 : 67저 0703',
          style: TextStyle(
            letterSpacing: 3.0,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('이동'),
            ),
            ElevatedButton(
              onPressed: () {
                AUTH.signOut();
              },
              child: Text('출차'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('픽업'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('특이사항'),
            ),
            ElevatedButton(
              onPressed: () {
                AUTH.signOut();
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('안에 개있음'),
                          actions: [
                            TextButton(
                              child: const Text('확인'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text('인사관리'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('스케쥴관리'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('공지사항 관리'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('시승차 관리'),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
                  child: Text(
                    '관리자 권한부여',
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
