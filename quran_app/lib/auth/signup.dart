import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/component/customedbutten%20.dart';

import 'package:quran_app/component/customedtextfiel.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 900,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(top: 400),
                child: Opacity(
                  opacity: 0.1,

                  child: Image.asset("images/logo.png", fit: BoxFit.fill),
                ),
              ),
            ),

            ListView(
              padding: EdgeInsets.all(30),
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    "Quran App",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Asalamu Alaikm !!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBE87E6),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBE87E6),
                    ),
                  ),
                ),
                Form(
                  key: formState,
                  child: Column(
                    children: [
                      Customedtextfiel(
                        text: "username",
                        controller: username,
                        validator: (val) {
                          if (val == "") {
                            return "Enter your username";
                          }
                        },
                        obscureText: false,
                      ),
                      Container(height: 20),
                      Customedtextfiel(
                        text: "email",
                        controller: email,
                        validator: (val) {
                          if (val == "") {
                            return "Enter your email";
                          }
                        },
                        obscureText: false,
                      ),
                      Container(height: 20),
                      Customedtextfiel(
                        text: "password",
                        controller: password,
                        validator: (val) {
                          if (val == "") {
                            return "Enter your password";
                          }
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFFBE87E6),
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "login");
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text.rich(
                      textAlign: TextAlign.end,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Do Have an Account ? ",
                            style: TextStyle(color: Color(0xFF300759)),
                          ),
                          TextSpan(
                            text: "Login ",
                            style: TextStyle(
                              color: Color(0xFFBE87E6),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Customedbutton(
                  name: "Sign In",
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                        Navigator.pushReplacementNamed(context, "login");
                      } on FirebaseAuthException catch (e) {
                        String errormessage;
                        if (e.code == 'weak-password') {
                          errormessage = 'The password provided is too weak.';
                        } else if (e.code == 'email-already-in-use') {
                          errormessage =
                              'The account already exists for that email.';
                        } else {
                          errormessage = "Error: ${e.message}";
                        }
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: errormessage,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      print("The field is empty");
                    }
                  },
                ),
                Container(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
