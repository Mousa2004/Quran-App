import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/mosquepage.dart';
import 'package:quran_app/quranpage.dart';
import 'package:quran_app/readingquranpage.dart';

class Buttonavigationpage extends StatefulWidget {
  const Buttonavigationpage({super.key});

  @override
  State<Buttonavigationpage> createState() => _ButtonavigationpageState();
}

class _ButtonavigationpageState extends State<Buttonavigationpage> {
  int selectpage = 0;

  final List<Widget> pages = [
    Quranpage(),
    Readingquranpage(surahNumber: 1, surahName: 'الفاتحة'),
    Mosquepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF8ECFB),
        currentIndex: selectpage,
        onTap: (value) {
          setState(() {
            selectpage = value;
          });
        },
        selectedItemColor: Color(0xFF300759),

        unselectedItemColor: Color(0xFF300759),

        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF8ECFB),
            icon:
                selectpage == 0
                    ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF300759),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF300759),
                            blurRadius: 0,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.book,
                        size: 35,
                        color: Color(0xFFE1BEE7),
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE1BEE7),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF7B15BF).withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.bookQuran,
                        size: 30,
                        color: Color(0xFF300759),
                      ),
                    ),
            label: "",
          ),

          BottomNavigationBarItem(
            icon:
                selectpage == 1
                    ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF300759),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF300759),
                            blurRadius: 0,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.bookOpen,
                        size: 35,
                        color: Colors.grey[400],
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE1BEE7),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF7B15BF).withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.bookOpen,
                        size: 30,
                        color: Color(0xFF300759),
                      ),
                    ),
            label: "",
          ),

          BottomNavigationBarItem(
            icon:
                selectpage == 2
                    ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF300759),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF300759),
                            blurRadius: 0,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.mosque,

                        size: 35,
                        color: Color(0xFFE1BEE7),
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE1BEE7),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF7B15BF).withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: FaIcon(
                        FontAwesomeIcons.mosque,
                        size: 30,
                        color: Color(0xFF300759),
                      ),
                    ),
            label: "",
          ),
        ],
      ),
      body: pages[selectpage],
    );
  }
}
