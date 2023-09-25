import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teamhusky/car/team1/provider/provider.dart';
import 'package:teamhusky/car/team1/team1_car_list.dart';
import 'package:teamhusky/car/team1/team1_numbercard.dart';
import 'package:teamhusky/car/team1/team1_adress_const.dart';
import 'package:teamhusky/car/team1/team1_model.dart';

class FirstSystem extends StatefulWidget {
  final String name;

  const FirstSystem({
    super.key,
    required this.name,
  });

  @override
  State<FirstSystem> createState() => _FirstSystemState();
}

class _FirstSystemState extends State<FirstSystem> {
  String carNumber = '';
  int check = 0;
  String CarListAdress = CARLIST+formatTodayDate();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomBarModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('현모스 강남점 차량관리 시스템'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _LocationName(),
              SizedBox(
                height: 20,
              ),
              _Lists(
                name: widget.name,
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            Consumer<BottomBarModel>(builder: (context, model, child) {
          return model.showCustomBottomBar ? bottomTwo() : bottomOne();
        }),
      ),
    );
  }

  Widget bottomOne() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        '입차번호',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      actions: [
                        TextField(
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: '입차번호를 입력해주세요',
                          ),
                          onChanged: (value) {
                            carNumber = value;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.pop(context);

                                  try {
                                    await FirebaseFirestore.instance
                                        .collection(LOTARY)
                                        .add({
                                      'carNumber': carNumber,
                                      'name': '',
                                      'createdAt': FieldValue.serverTimestamp(),
                                      'location': 0,
                                      'color': 1,
                                      'etc': '',
                                    });
                                  } catch (e) {}
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection(CarListAdress)
                                        .add({
                                      'carNumber': carNumber,
                                      'name': '',
                                      'enter': FieldValue.serverTimestamp(),
                                      'out': '',
                                      'location': '',
                                      'color': '',
                                      'etc': '',
                                    });
                                  } catch (e) {}
                                },
                                child: Text('입력'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('취소')),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('입차'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarList(),
                  ),
                );
              },
              child: Text('입차리스트'),
            ),
          )
        ],
      ),
      color: Colors.black,
    );
  }

  Widget bottomTwo() {
    return BottomAppBar(
      color: Colors.black,
    );
  }
}

class _LocationName extends StatelessWidget {
  const _LocationName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              '로터리',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              '외벽',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '광장',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              '문앞',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              '신사',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Lists extends StatelessWidget {
  final String name;

  const _Lists({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              RotaryList(
                name: name,
                location: LOTARY,
                reverse: 1,
                check: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              RotaryList(
                name: name,
                location: OUTSIDE,
                reverse: 0,
                check: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              RotaryList(
                name: name,
                location: MAIN,
                reverse: 0,
                check: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              RotaryList(
                name: name,
                location: MOON,
                reverse: 0,
                check: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              RotaryList(
                name: name,
                location: SINSA,
                reverse: 0,
                check: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
