import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/homepage.dart';
import 'package:quran_app/notificationpage.dart';
import 'package:quran_app/readingquranpage.dart';
import 'package:quran_app/settingpage.dart';

class Quranpage extends StatefulWidget {
  const Quranpage({super.key});

  @override
  State<Quranpage> createState() => _QuranpageState();
}

class _QuranpageState extends State<Quranpage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List surahs = [];
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    fetchSurahs();
    super.initState();
  }

  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  Future<void> fetchSurahs() async {
    final response = await http.get(
      Uri.parse('https://api.alquran.cloud/v1/surah'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        surahs = data['data'];
      });
    } else {
      throw Exception('فشل في تحميل السور');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8ECFB),

      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PopupMenuButton(
                  color: Colors.white,
                  offset: Offset(10, 170),
                  borderRadius: BorderRadius.circular(150),
                  icon: Image.asset("images/iconimg.png"),
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFF300759),
                                  shape: BoxShape.circle,
                                ),

                                child: FaIcon(
                                  FontAwesomeIcons.moon,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                textAlign: TextAlign.end,
                                "Mohamed Ayman",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.compass,
                                  size: 35,
                                  color: Color(0xFF300759),
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                "Explore",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Notificationpage(),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.bell,
                                  size: 35,
                                  color: Color(0xFF300759),
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                "Notification",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Settingpage(),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.gear,
                                  size: 35,
                                  color: Color(0xFF300759),
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                "Settings",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () async {
                            GoogleSignIn googleSignIn = GoogleSignIn();
                            googleSignIn.disconnect();
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "login",
                              (route) => false,
                            );
                          },
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.externalLinkSquareAlt,
                                  size: 35,
                                  color: Color(0xFF300759),
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                              (route) => false,
                            );
                          },
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowDownShortWide,
                                  size: 35,
                                  color: Color(0xFF300759),
                                ),
                              ),
                              Container(width: 20),
                              Text(
                                "Exit",
                                style: TextStyle(
                                  color: Color(0xFF300759),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),

                Text(
                  "Quran App",
                  style: TextStyle(
                    color: Color(0xFF300759),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 65),
                  decoration: BoxDecoration(
                    color: Color(0xFFE1BEE7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 35,
                  width: 110,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xFF300759),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 35, top: 25),
              child: Text(
                "Asalamu Alaikum !!!",
                style: TextStyle(
                  color: Color(0xFF7B15BF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 8),
              child: Text(
                "Mohamed Ayman",
                style: TextStyle(
                  color: Color(0xFF300759),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 25),
              height: 150,

              child: Image.asset("images/centerimage.png"),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: TabBar(
                labelColor: Color(0xFF300759),
                indicatorColor: Color(0xFF300759),
                unselectedLabelColor: Color(0xFF7B15BF),
                labelStyle: TextStyle(fontSize: 17),
                unselectedLabelStyle: TextStyle(fontSize: 16),
                controller: tabController,
                tabs: [
                  Tab(text: "Surah"),
                  Tab(text: "Tafsir"),
                  Tab(text: "Audio"),
                  Tab(text: "Hadith"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  if (surahs.isEmpty)
                    Center(child: CircularProgressIndicator())
                  else
                    ListView.builder(
                      itemCount: surahs.length,
                      itemBuilder: (context, index) {
                        final surah = surahs[index];
                        return ListTile(
                          title: Text(
                            '${surah['name']}',
                            style: TextStyle(fontSize: 18),
                          ),

                          trailing: Text(
                            'رقم ${surah['number']}',
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Readingquranpage(
                                      surahNumber: surah['number'],
                                      surahName: surah['name'],
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                  Center(child: Text("Para")),
                  Center(child: Text("Page")),
                  Center(child: Text("Hijb")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
