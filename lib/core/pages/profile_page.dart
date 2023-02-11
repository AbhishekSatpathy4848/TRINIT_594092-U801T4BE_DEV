import 'package:flutter/material.dart';
import 'package:ngo_hackathon/features/profile_page/ngo_profile.dart';
import 'package:ngo_hackathon/features/profile_page/phil_profile.dart';

class ProfilePage extends StatefulWidget {
  String type;
  ProfilePage({super.key, required this.type});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return (widget.type == 'Philanthropist') ? PhilProfile() : NgoProfile();
  }
}
