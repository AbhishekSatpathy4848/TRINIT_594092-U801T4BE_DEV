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
        ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phone.text.isNotEmpty &&
                  city.text.isNotEmpty &&
                  state.text.isNotEmpty &&
                  desc.text.isNotEmpty) {
                PhilanthropistModel philanthropistModel = PhilanthropistModel(
                    name: nameController.text,
                    email: email,
                    phoneNo: phone.text,
                    profilePhoto:
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                    preferredAreaofimpact: ['Education', 'Healthcare'],
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
              }
            },
            child: const Text('Submit'))
      ])),
    );
  }
}
