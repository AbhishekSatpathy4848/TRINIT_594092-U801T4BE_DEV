import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ngo_hackathon/features/login/registration/login.dart';
import 'package:ngo_hackathon/home.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      home: const LoginCheck(),
      routes: {
        '/': (context) => const LoginCheck(),
        // '/login': (context) => Login(),
        // '/register': (context) => Registration(),
        // '/home': (context) => Home(),
      },
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
    ),
  );
}

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                print("Login Successful");
                // print("Called-main filling hive");
                // Boxes.fillHive();
                // print("Done-main filling Hive");
                return const HomePage();
              } else if (snapshot.hasError) {
                print("Error");
                // Fluttertoast.showToast(
                // msg: "There was an Error in Logging you in!!",
                // toastLength: Toast.LENGTH_SHORT,
                // gravity: ToastGravity.CENTER,
                // );
                return Login();
              } else {
                // print("No Data");
                  return Login();
              }
            })));
  }
}
