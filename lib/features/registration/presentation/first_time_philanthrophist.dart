import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngo_hackathon/core/models/philanthropist_model.dart';
import 'package:ngo_hackathon/core/pages/home.dart';
import 'package:ngo_hackathon/root_page.dart';

class NewPhilanthrophist extends StatefulWidget {
  const NewPhilanthrophist({super.key});

  @override
  State<NewPhilanthrophist> createState() => _NewPhilanthrophistState();
}

class _NewPhilanthrophistState extends State<NewPhilanthrophist> {
  @override
  void dispose() {
    nameController.dispose();
    phone.dispose();
    city.dispose();
    state.dispose();
    desc.dispose();
    super.dispose();
  }

  final email = FirebaseAuth.instance.currentUser!.email;
  TextEditingController nameController = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController desc = TextEditingController();
  bool firstTimeLogin = true;

  List<String> impactAreas = [
    "Charitable Orientation",
    "Service Orientation",
    "Participatory Orientation",
    "Empowering Orientation",
    "Community-based Organizations (CBOs)",
    "Citywide Organizations",
    "National NGOs",
    "International NGOs."
  ];
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        Column(
          children: [
            const Text(
              'Name',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter your Phone Number',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            const Text(
              'City',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: city,
              decoration: const InputDecoration(
                hintText: 'Enter your City',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            const Text(
              'State',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: state,
              decoration: const InputDecoration(
                hintText: 'Enter your State',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your State';
                }
                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            const Text(
              'Brief Description',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: desc,
              decoration: const InputDecoration(
                hintText: 'Enter a brief description about yourself',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be left blank';
                }
                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Select the type of organizations you would like to support",
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Service Orientation',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[0],
                      onChanged: (v) {
                        setState(() {
                          isSelected[0] = !isSelected[0];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Participatory Orientation',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[1],
                      onChanged: (v) {
                        setState(() {
                          isSelected[1] = !isSelected[1];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Empowering Orientation',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[2],
                      onChanged: (v) {
                        setState(() {
                          isSelected[2] = !isSelected[2];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Community-based Organizations (CBOs)',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[3],
                      onChanged: (v) {
                        setState(() {
                          isSelected[3] = !isSelected[3];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Citywide Organizations',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[4],
                      onChanged: (v) {
                        setState(() {
                          isSelected[4] = !isSelected[4];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Statewide Organizations',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[5],
                      onChanged: (v) {
                        setState(() {
                          isSelected[5] = !isSelected[5];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'National Organizations',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[6],
                      onChanged: (v) {
                        setState(() {
                          isSelected[6] = !isSelected[6];
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'International Organizations',
                    style: TextStyle(fontSize: 14),
                  ),
                  Checkbox(
                      value: isSelected[7],
                      onChanged: (v) {
                        setState(() {
                          isSelected[7] = !isSelected[7];
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phone.text.isNotEmpty &&
                  city.text.isNotEmpty &&
                  state.text.isNotEmpty &&
                  desc.text.isNotEmpty) {
                List<String> impact = [];
                for (int i = 0; i < isSelected.length; i++) {
                  if (isSelected[i]) {
                    impact.add(impactAreas[i]);
                  }
                }
                PhilanthropistModel philanthropistModel = PhilanthropistModel(
                    name: nameController.text,
                    email: email,
                    phoneNo: phone.text,
                    profilePhoto:
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                    preferredAreaofimpact: impact.isEmpty ? null : impact,
                    followingNgo: null,
                    city: city.text,
                    state: state.text,
                    communities: null,
                    description: desc.text,
                    firstTimeLogin: firstTimeLogin);
                final docUser =
                    FirebaseFirestore.instance.collection('users').doc();
                docUser.set({'email': email, 'type': 'Philanthropist'});
                philanthropistModel.createPhilanthropist(philanthropistModel);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const RootPage()));
              } else {
                SnackBar snackBar = const SnackBar(
                  content: Text("Please fill all the fields"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Submit'))
      ])),
    );
  }
}
