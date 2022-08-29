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
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      Utils.cupertinoBox(context, e.message);
    } on Exception catch (e) {
      Utils.cupertinoBox(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: const Color.fromARGB(255, 219, 162, 229),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 350,
                width: 350,
                decoration: AppTheme.design,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Create Account',style: TextStyle(fontSize: 20),),
                        const FormDesign(labelText: 'Email',),
                        const FormDesign(labelText: 'Password',),
                        ElevatedButton(
                            onPressed: () {
                              signIn();
                            },
                            child: const Text('Create'),
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
      ),
    );
  }
}
