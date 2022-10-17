import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  Future<void> googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleuser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken,
          accessToken: googleAuth?.accessToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseException catch (e) {
      print("ERROR");
    }
  }
}
