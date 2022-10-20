// import 'package:aug_prj/screens/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'googlesignin.dart';

// class GoogleSignInButton extends StatefulWidget {
//   const GoogleSignInButton({Key? key}) : super(key: key);

//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }

// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   bool _isSigningIn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 3.0),
//       child: _isSigningIn
//           ? CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//             )
//           : OutlinedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                 ),
//               ),
//               onPressed: () async {
//                 setState(() {
//                   _isSigningIn = true;
//                 });
//                 User? user =
//                     await Authentication.signInWithGoogle(context: context);
//                 setState(() {
//                   _isSigningIn = false;
//                 });
//                 if (user != null) {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => const HomePage()),
//                   );
//                 }
//               },
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const <Widget>[
//                     Image(
//                       image: AssetImage("assets/google.png"),
//                       height: 35.0,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10),
//                       child: Text(
//                         'Sign in',
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
