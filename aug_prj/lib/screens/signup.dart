import 'package:aug_prj/Utils/utils.dart';
import 'package:aug_prj/design/box_design.dart';
import 'package:aug_prj/design/form_design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Future SignIn() async {
  //     try {
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailcontroller.text.trim(),
  //         password: _passwordcontroller.text.trim(),
  //       );
  //       if (FirebaseAuth.instance.currentUser != null) {
  //         Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       Utils.cupertinoBox(context, e.message);
  //     } on Exception catch (e) {
  //       Utils.cupertinoBox(context, e.toString());
  //     }
  //   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 240,
              width: 300,
              decoration: AppTheme.design,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Create Account'),
                      FormDesign(),
                      FormDesign(),
                      ElevatedButton(
                        onPressed: () {
                         
                        },
                        child: const Text('Log In'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 210, 82, 232),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400))),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
