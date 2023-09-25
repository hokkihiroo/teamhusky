import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamhusky/education/education_view.dart';
import 'package:teamhusky/layout/default_layout.dart';
import 'package:teamhusky/organization/organization_view.dart';
import 'package:teamhusky/user/view/user_auth.dart';

import '../car/car_view.dart';
import '../common/const/colors.dart';
import '../gongzi/notice_view.dart';
import '../myinfo/myinfo_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  String title = '인사';
  late TabController controller;
  int index = 0;
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(tabListner);

    getCurrentUser();
  }

  @override
  void dispose() {
    controller.removeListener(tabListner);
    super.dispose();
  }

  void tabListner() {
    setState(() {
      index = controller.index;
    });
  }

  void getCurrentUser() async {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
        print(loggedUser!.uid);

        final QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                // .collection('$BONSA/$loggedUser!.uid')
                .collection('user/KZwZFZ6RV8WKvynPHZDs/bonsa')
                .where(loggedUser!.uid)
                .get();
        if (querySnapshot.docs.isNotEmpty) {
          // 첫 번째로 일치하는 문서에서 이름 필드 값을 반환
          name = querySnapshot.docs[0].get('name');
          print(name);

        } else {
          // 일치하는 문서가 없을 경우 null 반환
          name = '';
          print('이게뜨면안되지');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: title,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Organization(),
          Car(name: name,),
          NoticeView(),
          Education(),
          MyInfo(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
          if (index == 0) {
            title = '인사';
          } else if (index == 1) {
            title = '지역 시스템';
          } else if (index == 2) {
            title = '1팀 교육 목록';
          } else if (index == 3) {
            title = '교육';
          } else if (index == 4) {
            title = 'MyPage';
          }
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '인사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize),
            label: '출차',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever_rounded),
            label: '공지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label_important_outline),
            label: '교육',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label_important_outline),
            label: '정보',
          ),
        ],
      ),
    );
  }
}
