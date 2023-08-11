import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdu_admin/home/view/update_function.dart';
import 'package:mdu_admin/map/map.dart';
import 'package:mdu_admin/map/map_model.dart';
import 'package:mdu_admin/theme/theme.dart';

import 'dart:math';

import '../../constants/constants.dart';

final Random random = Random();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.whatsAppTealGreen,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MapScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.location_on,
        ),
      ),
      appBar: buildNav(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(
              'issues',
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // If there's data, build your UI based on the documents in the collection
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              String issueId = (snapshot.data!.docs[index].id);
              String userName =
                  snapshot.data!.docs[index]['post_username'] ?? '';
              int complaintType =
                  snapshot.data!.docs[index]['complaint_type'] ?? '';
              double lat = snapshot.data!.docs[index]['latitude'] ?? '';
              double long = snapshot.data!.docs[index]['longitude'] ?? '';
              allMapModels.add(
                MapModel(
                  lat: lat,
                  lng: long,
                  ward: random.nextInt(100),
                  issueType: complaintType,
                ),
              );
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: ExpansionTile(
                      iconColor: AppColor.whatsAppTealGreen,
                      collapsedIconColor: AppColor.whatsAppTealGreen,
                      collapsedTextColor: AppColor.whatsAppTealGreen,
                      textColor: Colors.black,
                      leading: Icon(
                        icons[complaintType],
                      ),
                      title: Text(
                        issueMapping[complaintType],
                      ),
                      subtitle: Text(
                        "Ward Number ${random.nextInt(
                          100,
                        )}",
                      ),
                      childrenPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  updateDocument(1, issueId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2,
                                      ),
                                    ),
                                    color: Colors.pinkAccent,
                                  ),
                                  child: const Text(
                                    "Reviewed",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  updateDocument(2, issueId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "In Progress",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  updateDocument(3, issueId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Resolved",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  updateDocument(4, issueId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Suspended",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  AppBar buildNav() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.whatsAppTealGreen,
      title: const Text(
        'Marvel Madurai Admin Pannel',
      ),
    );
  }
}
