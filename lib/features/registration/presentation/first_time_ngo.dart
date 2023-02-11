import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_hackathon/core/models/ngo_model.dart';
import 'package:ngo_hackathon/root_page.dart';

class NewNGO extends StatefulWidget {
  const NewNGO({super.key});

  @override
  State<NewNGO> createState() => _NewNGOState();
}

class _NewNGOState extends State<NewNGO> {
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController previousWork = TextEditingController();
  TextEditingController mission = TextEditingController();
  TextEditingController currentGoal = TextEditingController();
  TextEditingController funding = TextEditingController();
  TextEditingController impact = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  String? choice;

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
  @override
  void dispose() {
    name.dispose();
    desc.dispose();
    city.dispose();
    state.dispose();
    funding.dispose();
    mission.dispose();
    impact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Column(
            children: [
              const Text(
                'Name',
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: name,
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
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Description',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: desc,
              decoration: const InputDecoration(
                hintText: 'Enter a brief description',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your description';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(
            children: [
              const Text(
                'Impact Area',
                style: TextStyle(fontSize: 14),
              ),
              DropdownButton<String>(
                value: choice,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.orange),
                underline: Container(
                  height: 2,
                  color: Colors.orangeAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    choice = newValue;
                  });
                },
                items:
                    impactAreas.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'City',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: city,
              decoration: const InputDecoration(
                hintText: 'Enter your city',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'State',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: state,
              decoration: const InputDecoration(
                hintText: 'Enter your state',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Phone',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter your phone numbers',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone numbers';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Email',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Enter your emails',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your emails';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Previous Work',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: previousWork,
              decoration: const InputDecoration(
                hintText: 'Enter your previous works',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a brief description your previous works';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Current Goal(s)',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: currentGoal,
              decoration: const InputDecoration(
                hintText: 'Enter your current goal(s)',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your current goal';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Impact',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: impact,
              decoration: const InputDecoration(
                hintText: 'Enter your impact',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your impact';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Funding',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: funding,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter funding required',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your funding';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          Column(children: [
            const Text(
              'Mission',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: mission,
              decoration: const InputDecoration(
                hintText: 'Enter your mission',
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mission';
                }
                return null;
              },
            ),
          ]),
          const SizedBox(height: 5),
          const SizedBox(height: 5),
          ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty &&
                    desc.text.isNotEmpty &&
                    city.text.isNotEmpty &&
                    state.text.isNotEmpty &&
                    funding.text.isNotEmpty &&
                    mission.text.isNotEmpty &&
                    impact.text.isNotEmpty) {
                  NgoModel ngoModel = NgoModel(
                      userEmail: FirebaseAuth.instance.currentUser!.email,
                      city: city.text,
                      description: desc.text,
                      fundingNeeds: int.parse(funding.text),
                      impactOnEnvironment: impact.text,
                      mission: mission.text,
                      name: name.text,
                      state: state.text,
                      community: null,
                      currentGoals: currentGoal.text,
                      profilePhoto: null,
                      photos: null,
                      news: null,
                      phoneNumbers: phone.text.split(" "),
                      followerCount: 0,
                      firstTimeLogin: true,
                      fieldsOfImpact: [choice!],
                      previousWork: previousWork.text,
                      type: choice,
                      emails: email.text.split(" "));
                  print(ngoModel.toJson());
                  final docUser =
                      FirebaseFirestore.instance.collection('users').doc();
                  docUser.set({
                    'email': FirebaseAuth.instance.currentUser!.email,
                    'type': 'NGO'
                  });
                  ngoModel.createNgo(ngoModel);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RootPage()));
                } else {
                  SnackBar snackBar = const SnackBar(
                    content: Text("Please fill all the fields"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print("Please fill all the fields");
                }
              },
              child: const Text('Submit'))
        ],
      )),
    );
  }
}
