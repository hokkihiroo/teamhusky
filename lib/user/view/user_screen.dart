import 'package:flutter/material.dart';
import 'package:teamhusky/common/component/custom_text_form.dart';
import 'package:teamhusky/user/view/user_auth.dart';
import 'package:teamhusky/user/view/user_resume.dart';
import '../../common/const/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../view/main_view.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  String id = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'asset/img/logo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: CustomTextForm(
                            hintText: '아이디',
                            onChanged: (String value) {
                              id = value;
                            },
                            icon: Icon(
                              Icons.account_circle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: CustomTextForm(
                            hintText: '비밀번호 ',
                            onChanged: (String value) {
                              password = value;
                            },
                            obscureText: true,
                            icon: Icon(
                              Icons.manage_accounts_rounded,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              final newUser = await AUTH
                                  .signInWithEmailAndPassword(
                                email: id,
                                password: password,
                              );
                              if (newUser.user != null) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return MainView();
                                //     },
                                //   ),
                                // );
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            '로그인',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return UserResume();
                              }),
                            );
                          },
                          child: Text(
                            '이력서작성',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 600,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    '해당 앱은 팀허스키 직원 전용앱입니다. \n Copyright © Team.HUSKY 2018',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
