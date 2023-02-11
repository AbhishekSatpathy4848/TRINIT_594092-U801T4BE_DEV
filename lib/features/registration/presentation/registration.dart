import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatelessWidget {
  Registration({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // String email = '';
  Future registerUser(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // Fluttertoast.showToast(
      //     msg: "User Registered Successfully!!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM_LEFT);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      print(error.code);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      if (error.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid Email!!')));
      } else if (error.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User Already Exists!!')));
      } else if (error.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please use a Stronger Password!!')));
      } else if (error.code == 'network-request-failed') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please connect to the internet!!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.grey[900],
      body: Container(
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/BackgroundStars.jpeg'),
        //         fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Text('$email and $password'),
                const Text(
                  "Let's get you signed up!!",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      letterSpacing: 1.2,
                      fontFamily: 'Open Sans-2'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be left blank';
                    } else {
                      return null;
                    }
                  }),
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
                TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be left blank';
                    } else {
                      return null;
                    }
                  }),
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter Your Password',
                  ),
                ),
                const SizedBox(height: 30),
                RawMaterialButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text.trim() ==
                          confirmPasswordController.text.trim()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Registering User...'),
                          duration: Duration(days: 365),
                        ));
                        await registerUser(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Passwords don't Match!!")));
                      }
                    }
                  },
                  fillColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.app_registration,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text("Sign Up",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ]),
                  // )
                ),
                Row(
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Sign In"))
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
