import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('======User is currently signed out!');
      } else {
        print('======User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0DCFA),
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: ListView(
          children: [
            Text(
              "Quran App",
              style: TextStyle(
                color: Color(0xFF300759),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Text(
                "Learn Quran every day and recite once everyday",
                style: TextStyle(
                  color: Color(0xFF7B15BF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFF300759),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      "images/logo.png",
                      height: 400,
                      width: 400,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Color(0xFF7B15BF),
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "buttomnavigation",
                            (route) => false,
                          );
                        } else {
                          Navigator.of(
                            context,
                          ).pushNamedAndRemoveUntil("login", (route) => false);
                        }
                      },
                      child: Text(
                        "Get started",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
