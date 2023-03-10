import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngo_hackathon/features/registration/presentation/registration.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // Future<FirebaseApp> _initializeFirebase() async {
  void signIn(context) async {
    try {
      print("Inside Sign in");
      WidgetsFlutterBinding.ensureInitialized();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Logging in...'),
        // duration: Duration(days: 365),
      ));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    } on FirebaseAuthException catch (error) {
      // print(error.code);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      if (error.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid Email!!')));
      } else if (error.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User not found!!')));
      } else if (error.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Incorrect Password!!')));
      } else if (error.code == 'network-request-failed') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please connect to the internet!!')));
      }
    } catch (e) {
      //ScaffoldMessenger.of(context).removeCurrentSnackBar();
      print(e);
    }
  }

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String email = '';

  String password = '';

  // loadingHabitsDialog(context) {
  //   showDialog(
  //       context: context,
  //       builder: ((context) {
  //         return BackdropFilter(
  //             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  //             child: Dialog(
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(15.0)),
  //               backgroundColor: Colors.grey[900],
  //               child: Padding(
  //                 padding: const EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 30.0),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     const Text("Loading Habits...",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w700, fontSize: 18)),
  //                     const SizedBox(height: 40),
  //                   ],
  //                 ),
  //               ),
  //             ));
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      body: Container(
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/BackgroundStars.jpeg'),
        //         fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  "Welcome Back!!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 237, 183, 5),
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      letterSpacing: 1.2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Let's Build a better society!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1.2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be left blank';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: const TextStyle(
                      // color: Colors.grey[600]
                      ),
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      labelStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          // color: Colors.amberAccent[200],
                          // fontSize: 24
                          )),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be left blank';
                    } else {
                      return null;
                    }
                  }),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                  ),
                ),
                const SizedBox(height: 30),
                RawMaterialButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () {
                    // email = emailController.text.trim();
                    // password = passwordController.text.trim();
                    if (_formKey.currentState!.validate()) {
                      signIn(context);
                    }
                  },
                  fillColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.lock_open,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text("Sign In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ]),
                ),
                Row(
                  children: [
                    const Text("Not registered yet?"),
                    TextButton(
                        onPressed: () {
                          // if (_formKey.currentState!= null) {
                          //   if(_formKey.currentState!.validate())
                          //     return;
                          // }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Registration();
                          }));
                        },
                        child: const Text("Create Account"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
