import 'package:aug_prj/repository/googlesignin.dart';
import 'package:aug_prj/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
class AuthService extends StatelessWidget {
  const AuthService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went Wrong'));
        } else if (snapshot.hasData && snapshot.data != null) {
          UserHelper.saveuser(snapshot.data as User);
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
