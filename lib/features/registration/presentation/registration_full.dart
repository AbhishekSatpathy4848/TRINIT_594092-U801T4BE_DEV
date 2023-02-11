import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegComplete extends StatefulWidget {
  const RegComplete({super.key});

  @override
  State<RegComplete> createState() => _RegCompleteState();
}

class _RegCompleteState extends State<RegComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.grey[150],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
