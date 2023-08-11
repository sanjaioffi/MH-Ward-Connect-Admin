import 'package:flutter/material.dart';
import 'package:mdu_admin/constants/constants.dart';
import 'package:mdu_admin/theme/theme.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whatsAppTealGreen,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Madurai Ward Admin Console",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: issueTypes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        title: Text(
                          issueTypes[index],
                          style: const TextStyle(
                            color: AppColor.whatsAppTealGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        childrenPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 5,
                        ),
                        children: [
                          Column(
                            children: [
                              ListTile(
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_outward_rounded,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                                title: const Text(
                                  "Ward Number 20",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const ListTile(
                                title: Text(
                                  "Ward Number 20",
                                ),
                                trailing: Text(
                                  "Coordinate",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
