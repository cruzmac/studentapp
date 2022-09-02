import 'package:aug_prj/Utils/utils.dart';
import 'package:aug_prj/design/form_design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  late final TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      if (userCredential.user != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
        Utils.cupertinoBox2(context, 'Account Created');
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                controller: tabcontroller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Up Coming',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Finished',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: tabcontroller, children: [
                  signin('Create'),
                  signin('Delete'),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container signin(String str) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),borderRadius:BorderRadius.all(Radius.circular(20)) ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
           Text(
            '$str Account',
            style: TextStyle(fontSize: 20),
          ),
          FormDesign(
            labelText: 'Email',
            controller: _emailcontroller,
          ),
          FormDesign(
            labelText: 'Password',
            controller: _passwordcontroller,
          ),
          ElevatedButton(
              onPressed: () {
                signIn();
              },
              child:  Text(str),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 210, 82, 232),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400))),
        ]),
      ),
    );
  }
}
