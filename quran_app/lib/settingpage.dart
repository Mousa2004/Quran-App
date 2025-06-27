import 'package:flutter/material.dart';
import 'package:quran_app/buttonavigationpage.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8ECFB),
      body: ListView(
        children: [
          Container(padding: EdgeInsets.only(top: 50)),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 40),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Buttonavigationpage(),
                    ),
                    (route) => false,
                  );
                },
                icon: Image.asset("images/back.png", height: 35, width: 35),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0xFF300759),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Icon(Icons.settings, size: 35, color: Colors.grey[600]),
              ),
            ],
          ),

          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Text(
                "Account",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF300759), fontSize: 20),
              ),
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "mo.ayman2692004@gmail.com",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 140,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        "01271932789",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 200,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text("Egypt", style: TextStyle(fontSize: 18)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 160,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text("26-9-2004", style: TextStyle(fontSize: 18)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 170,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text("Google", style: TextStyle(fontSize: 18)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 180,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Switch(
                        value: value,
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 20,
                        bottom: 20,
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.all(10),
                        color: Color(0xFFF8ECFB),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Make changes",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Text(
                "Notification",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF300759), fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SwitchListTile(
                    title: Text(
                      "Reminders",
                      style: TextStyle(color: Color(0xFF300759)),
                    ),
                    value: value1,
                    onChanged: (val) {
                      setState(() {
                        value1 = val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SwitchListTile(
                    title: Text(
                      "Recommendations",
                      style: TextStyle(color: Color(0xFF300759)),
                    ),
                    value: value2,
                    onChanged: (val) {
                      setState(() {
                        value2 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Text(
                "Privacy & Security",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF300759), fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 8,
                    right: 4,
                    bottom: 8,
                  ),
                  child: Text(
                    "Security is a fundamental component of [Program Name], designed to protect user data, ensure system integrity, and guard against cyber threats. The program incorporates a comprehensive set of security measures, including: User Authentication and Role-Based Access Control: Only authorized users can access specific features and sensitive data, ensuring privacy and operational integrity End-to-End Data Encryption: All data transmitted or stored within [Program Name] is encrypted to prevent unauthorized access or tampering.",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Text(
                "Help & Suport",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF300759), fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text("For further informtion about this app"),
                ),
                SizedBox(height: 10),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "CONTACT: "),
                      TextSpan(
                        text: "mo.ayman2692004@mail.com",
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Text(
                "About",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF300759), fontSize: 20),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    "Welcome to Quran App, Your number one sourc for all good things. We 're dedicated to roviding you the best of agirah, with a focus on agirah.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    "We're working to turn our mission towards agira. We hope you getthe god information as much as we gather affering them to you.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
