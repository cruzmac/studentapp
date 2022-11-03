import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Authentication {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
    return user;
  }

  signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static saveuser(User user) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildnumber = int.parse(packageInfo.buildNumber);
    Map<String, dynamic> userdata = {
      'name': user.displayName,
      'email': user.email,
      'last_login': user.metadata.lastSignInTime?.millisecondsSinceEpoch,
      'created_at': user.metadata.creationTime?.microsecondsSinceEpoch,
      'role': 'user',
      'build_number': buildnumber,
    };
    final userref = _db.collection('users').doc(user.uid);
    if ((await userref.get()).exists) {
      await userref.update({
        'last_login': user.metadata.lastSignInTime?.microsecondsSinceEpoch,
        'build_number': buildnumber,
      });
    } else {
      await userref.set(userdata);
    }
    await saveDevice(user);
  }

  static saveDevice(User user) async {
    DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
    String deviceId;
    Map<String, dynamic> deviceData;
      final deviceInfo = await devicePlugin.androidInfo;
      deviceId = deviceInfo.id.toString();
      deviceData = {
        'os_version': deviceInfo.version.sdkInt.toString(),
        'platform': 'android',
        'model': deviceInfo.model,
        'device': deviceInfo.device,
      };
    
    // else if(Platform.isIOS) {
    //   final deviceInfo = await devicePlugin.iosInfo;
    //   deviceId = deviceInfo.identifierForVendor.toString();
    //   deviceData = {
    //     'os_version': deviceInfo.systemVersion,
    //     'platform': 'IOS',
    //     'model': deviceInfo.model,
    //     'device': deviceInfo.name,
    //   };
    // }
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final deviceRef = _db
        .collection("users")
        .doc(user.uid)
        .collection('devices')
        .doc(deviceId);
    if ((await deviceRef.get()).exists) {
      await deviceRef.update({
        'updated_at': nowMs,
        'uninstalled': false,
      });
    } else {
      await deviceRef.set({
        'created_at':nowMs,
        'updated_at': nowMs,
        'uninstalled': false,
        'id':deviceId,
        'device_info':deviceData,
      });
    }
  }
}
