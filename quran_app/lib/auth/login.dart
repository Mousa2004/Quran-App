import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quran_app/component/customedbutten%20.dart';
import 'package:quran_app/component/customedtextfiel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  bool _obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushNamedAndRemoveUntil(
      context,
      "buttomnavigation",
      (route) => false,
    );
  }

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
                    "Sign In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBE87E6),
                    ),
                  ),
                ),

                Container(height: 20),
                Form(
                  key: formState,
                  child: Column(
                    children: [
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
                    if (email.text == "") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: "Please enter your emaill ",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                      return;
                    }
                    try {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email.text,
                      );
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'check your email',
                        desc:
                            "Please check your emaill and reset your passwoed",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    } catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: "Re-enter the correct email address",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Forget To Password ?",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Color(0xFFBE87E6)),
                    ),
                  ),
                ),
                Customedbutton(
                  name: "Login",
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "buttomnavigation",
                          (route) => false,
                        );
                      } on FirebaseAuthException catch (e) {
                        String errorMessage;

                        if (e.code == 'user-not-found') {
                          errorMessage = "No user found for that email.";
                        } else if (e.code == 'wrong-password') {
                          errorMessage =
                              "Wrong password provided for that user.";
                        } else if (e.code == 'invalid-email') {
                          errorMessage = "The email address is not valid.";
                        } else {
                          errorMessage = "Error: ${e.message}";
                        }

                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: errorMessage,
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

                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text("Or", textAlign: TextAlign.center),
                ),
                Container(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          size: 35,
                          color: Color(0xFF300759),
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 35,
                          color: Color(0xFF300759),
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.apple,
                          size: 35,
                          color: Color(0xFF300759),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "signup");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Color(0xFF300759)),
                          ),
                          TextSpan(
                            text: "Register here",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
