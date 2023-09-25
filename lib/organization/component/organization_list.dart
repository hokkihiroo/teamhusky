import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'insa.dart';
import 'organization_card.dart';

class OrganizationList extends StatelessWidget {
  const OrganizationList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('user/KZwZFZ6RV8WKvynPHZDs/bonsa')
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Insa(
                        image:docs[index]['image'],

                          name: docs[index]['name'],
                          team: docs[index]['team'],
                      );
                    },
                  );
                  print(index);
                },
                child: OrganizationCard(
                  image: Image.asset(
                    docs[index]['image'],
                    width: 70,
                    height: 60,
                  ),
                  position: docs[index]['position'],
                  name: docs[index]['name'],
                  team: docs[index]['team'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
