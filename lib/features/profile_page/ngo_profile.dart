import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngo_hackathon/core/models/ngo_model.dart';
import 'package:ngo_hackathon/core/models/philanthropist_model.dart';

class NgoProfile extends StatefulWidget {
  const NgoProfile({super.key});

  @override
  State<NgoProfile> createState() => _NgoProfileState();
}

class _NgoProfileState extends State<NgoProfile> {
  Future<NgoModel> getNgo() async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    Map<String, dynamic> json = await FirebaseFirestore.instance
        .collection('Ngo')
        .doc(email)
        .get()
        .then((value) => value.data() as Map<String, dynamic>);
    print(json);
    return NgoModel.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getNgo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: Image.network(snapshot.data!.profilePhoto == null
                          ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png'
                          : snapshot.data!.profilePhoto!),
                      height: 200,
                      width: 200),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const Text(
                      'Name: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data!.name!),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('Email: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Column(
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.emails!.length;
                                      i++)
                                    Text(snapshot.data!.emails![i])
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('Phone: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.phoneNumbers![0]),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('City: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.city!),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('State: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.state!),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('Description: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.description!),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('Past Work: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.previousWork!),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text('Misson: ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(snapshot.data!.currentGoals)
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    const Text('Impact: ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(snapshot.data!.impactOnEnvironment!),
                  ]),
                ]));
          }
        },
      ),
    );
  }
}
