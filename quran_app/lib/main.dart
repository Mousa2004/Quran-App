import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quran_app/auth/login.dart';
import 'package:quran_app/auth/signup.dart';
import 'package:quran_app/buttonavigationpage.dart';
import 'package:quran_app/homepage.dart';
import 'package:quran_app/quranpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => Signup(),
        "homepage": (context) => Homepage(),
        "quranpage": (context) => Quranpage(),
        "buttomnavigation": (context) => Buttonavigationpage(),
      },
    );
  }
}
