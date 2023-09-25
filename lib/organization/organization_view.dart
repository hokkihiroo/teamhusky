import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamhusky/organization/Schedule/Schedule.dart';
import 'package:teamhusky/organization/component/organization_card.dart';
import 'component/organization_building_card.dart';
import 'component/organization_list.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: BuildingCard(
                image: Image.asset(
                  'asset/img/main.png',
                  width: 70,
                  height: 60,
                ),
                name: '팀허스키',
                team: '본사',
                position: '강남 >',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OrganizationList(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Schedule.onTap1(context);
              },
              child: BuildingCard(
                image: Image.asset(
                  'asset/img/ddo.png',
                  width: 70,
                  height: 60,
                ),
                name: '현대모터스튜디오',
                team: '1팀',
                position: '강남 >',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: OrganizationCard(
                image: Image.asset(
                  'asset/img/ex4.png',
                  width: 70,
                  height: 60,
                ),
                name: '김재곤',
                team: '1팀',
                position: '팀장',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: OrganizationCard(
                image: Image.asset(
                  'asset/img/ex1.png',
                  width: 70,
                  height: 60,
                ),
                name: '최원준',
                team: '1팀',
                position: '팀원',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: OrganizationCard(
                image: Image.asset(
                  'asset/img/ex2.png',
                  width: 70,
                  height: 60,
                ),
                name: '김태호',
                team: '1팀',
                position: '팀원',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: OrganizationCard(
                image: Image.asset(
                  'asset/img/ho.png',
                  width: 70,
                  height: 60,
                ),
                name: '염호경',
                team: '앱개발',
                position: '버그발생시',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: OrganizationCard(
                  image: Image.asset(
                    'asset/img/ddo.png',
                    width: 70,
                    height: 60,
                  ),
                  name: '제네시스팀',
                  team: '2팀',
                  position: '용인',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }




}
