import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngo_hackathon/features/registration/presentation/first_time_ngo.dart';
import 'package:ngo_hackathon/features/registration/presentation/first_time_philanthrophist.dart';

class RegComplete extends StatefulWidget {
  const RegComplete({super.key});

  @override
  State<RegComplete> createState() => _RegCompleteState();
}

class _RegCompleteState extends State<RegComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            child: DefaultTabController(
          length: 2,
          child: Column(children: const [
            TabBar(tabs: [
              Tab(text: 'Philanthropist'),
              Tab(text: 'NGO'),
            ]),
            Expanded(
              child: TabBarView(children: [
                NewPhilanthrophist(),
                NewNGO(),
              ]),
            ),
          ]),
        )));
  }
}
