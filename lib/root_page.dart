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
  int currentpage = 0;
  final screens = [
    const NewPhilanthrophist(),
    const SearchPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('NGO-app'),
        ),
      ),
      body: IndexedStack(
        index: currentpage,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'explore'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentpage = index;
          });
        },
        selectedIndex: currentpage,
      ),
    );
  }
}
