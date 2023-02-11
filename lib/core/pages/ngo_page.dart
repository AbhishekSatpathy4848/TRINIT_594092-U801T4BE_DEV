import 'package:flutter/material.dart';

class NgoProfilePage extends StatelessWidget {
  final String ngoName;

  const NgoProfilePage({Key? key, required this.ngoName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsetsDirectional.only(end: 50.0),
          child: Center(
            child: Text('NGO-App'),
          ),
        )
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.lightGreen,
          //     Colors.greenAccent,
          //   ],
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
          // ),
        ),
        child: Column(
          children: [
            Container(
              height: 10.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://www.greenpeace.org/static/templates/Greenpeace/images/header/greenpeace-header-logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              ngoName,
              style: const TextStyle(
                fontSize: 36.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16.0),
                  const Text(
                    'Greenpeace is a non-governmental environmental organization with offices in over 55 countries and an international coordinating body in Amsterdam, the Netherlands.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Greenpeace is the leading independent campaigning organization that uses peaceful direct action and creative communication to expose global environmental problems and to promote solutions that are essential to a green and peaceful future.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    // color: Colors.green,
                    // textColor: Colors.white,
                    // padding: EdgeInsets.all(16.0),
                    onPressed: () {},
                    child: Text('Learn More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
      