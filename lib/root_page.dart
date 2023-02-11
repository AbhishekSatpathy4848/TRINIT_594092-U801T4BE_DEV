import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_hackathon/core/pages/search_page.dart';
import 'package:ngo_hackathon/features/registration/presentation/first_time_philanthrophist.dart';

import 'core/pages/home.dart';
import 'core/pages/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool firstTimeLogin = true;
  bool showNavBar = true;

  Future checkData() async {
    await FirebaseFirestore.instance.collection('users').get().then((value) => {
          value.docs.forEach((element) {
            if (element['email'] == FirebaseAuth.instance.currentUser!.email) {
              firstTimeLogin = false;
              showNavBar = true;
              //print(firstTimeLogin);
            }
          })
        });
    //setState(() {});
  }

  int currentpage = 0;
  final screens = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('NGO-App'),
        ),
      ),
      body: FutureBuilder(
          future: checkData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                firstTimeLogin) {
              //print('abc');
              return const NewPhilanthrophist();
            }
            //print('123');

            return IndexedStack(
              index: currentpage,
              children: screens,
            );
          }),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        onDestinationSelected: (int index) {
          if (firstTimeLogin == false) {
            setState(() {
              currentpage = index;
            });
          }
        },
        selectedIndex: currentpage,
      ),
    );
  }
}
