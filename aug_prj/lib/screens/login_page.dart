import 'package:aug_prj/Utils/preference.dart';
import 'package:aug_prj/Utils/utils.dart';
import 'package:aug_prj/design/box_design.dart';
import 'package:aug_prj/design/form_design.dart';
import 'package:aug_prj/repository/googlebutton.dart';
import 'package:aug_prj/repository/googlesignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future loginIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );
        if (FirebaseAuth.instance.currentUser != null) {
          await Preference.instance.setEmail(_emailcontroller.text);
          print(Preference.instance.getEmail());
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        Utils.cupertinoBox(context, e.message);
      } on Exception catch (e) {
        Utils.cupertinoBox(context, e.toString());
      }
    }

    // signInWithGoogle() async {
    //   final GoogleSignInAccount? googleuser =
    //       await GoogleSignIn(scopes: <String>['email']).signIn();
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleuser!.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //     idToken: googleAuth.idToken,
    //     accessToken: googleAuth.accessToken,
    //   );
    //   try {
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    //     if (FirebaseAuth.instance.currentUser != null) {
    //       Navigator.of(context)
    //           .pushNamedAndRemoveUntil('/home', (route) => false);
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     Utils.cupertinoBox(context, e.message);
    //   } on Exception catch (e) {
    //     Utils.cupertinoBox(context, e.toString());
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://img.freepik.com/premium-vector/graphic-designer-creating-his-artwork-using-computer_80802-1077.jpg',
              fit: BoxFit.fitHeight,
              height: 400,
            ),
            Stack(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 210, 82, 232)),
                    )),
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
                          loginIn();
                        },
                        child: const Text('Log In'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 210, 82, 232),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400))),
                    // GestureDetector(
                    //     onTap: () {

                    //      },
                    //     child: CircleAvatar(
                    //       radius: 30,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(28),
                    //         child: Image.asset("assets/google.png"),
                    //       ),
                    //       backgroundColor: Colors.black,
                    //     )),
                    const GoogleSignInButton(),
                  ],
                ),
                height: 350,
                width: 300,
                decoration: AppTheme.design,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
