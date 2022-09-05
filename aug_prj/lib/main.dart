import 'package:aug_prj/screens/events.dart';
import 'package:aug_prj/screens/home_page.dart';
import 'package:aug_prj/screens/list.dart';
import 'package:aug_prj/screens/login_page.dart';
import 'package:aug_prj/screens/signup.dart';
import 'package:aug_prj/screens/student.dart';
import 'package:aug_prj/screens/time_table.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: GoogleFonts.lobsterTextTheme(Theme.of(context).textTheme),
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black12),
      ),
      initialRoute: '/',
      onGenerateRoute: pageroutes,
    );
  }
}

Route<dynamic>? pageroutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final isLoggedin = FirebaseAuth.instance.currentUser;
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              isLoggedin != null ? const HomePage() : const LoginPage()));
    case '/home':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const HomePage()));
    case '/student':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const StudentDash()));
    case '/signupgen':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const SignUp()));
    case '/timetable':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const TimeTable()));
    case '/events':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const Events()));
    case '/acctlist':
      return (MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const AcctList()));
    default:
  }
  return null;
}
