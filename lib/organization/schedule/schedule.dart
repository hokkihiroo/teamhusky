import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamhusky/organization/schedule/carschedule_card.dart';
import 'package:teamhusky/organization/schedule/schedule_card.dart';

class Schedule {
  static void onTap1(BuildContext context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('schedule/Mz5cQeP99xZXzielRFsG/1team')
        .orderBy('time')
        .get();

    List<DocumentSnapshot> documents = querySnapshot.docs;
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection('schedule/Mz5cQeP99xZXzielRFsG/2team')
        .orderBy('time')
        .get();

    List<DocumentSnapshot> documents2 = querySnapshot2.docs;

    showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AlertDialog(
                title: Text('현대모터스튜디오 1팀'),
                content: Column(
                  children: documents.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return ScheduleCard(
                      time: data['time'],
                      name: data['name'],
                    );
                  }).toList(),
                ),
              ),

              AlertDialog(
                title: Text('시승차'),
                content: Column(
                  children: documents2.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                    return CarScheduleCard(
                      time: data['time'],
                      name: data['name'],
                    );
                  }).toList(),
                ),
                actions: [
                  TextButton(
                    child: const Text('확인'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
