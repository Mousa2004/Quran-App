import 'package:flutter/material.dart';
import 'package:quran_app/buttonavigationpage.dart';
import 'package:table_calendar/table_calendar.dart';

class Mosquepage extends StatefulWidget {
  const Mosquepage({super.key});

  @override
  State<Mosquepage> createState() => _MosquepageState();
}

class _MosquepageState extends State<Mosquepage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusday) {
    setState(() {
      today = day;
    });
  }

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
                  "Prayer",
                  style: TextStyle(
                    color: Color(0xFF300759),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Container(
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
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
            child: Container(
              decoration: BoxDecoration(
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
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                  defaultDecoration: BoxDecoration(color: Color(0xFFD49DDF)),
                  todayDecoration: BoxDecoration(
                    color: Colors.pink[50],
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(color: Color(0xFFD49DDF)),
                ),
                headerStyle: HeaderStyle(
                  decoration: BoxDecoration(color: Color(0xFFD49DDF)),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                locale: "en_US",
                rowHeight: 50,

                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
                focusedDay: today,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime(2100, 12, 31),
              ),
            ),
          ),
          SizedBox(height: 40),

          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 25),
            decoration: BoxDecoration(
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
            child: Column(
              children: [
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Fajr  ",
                            style: TextStyle(
                              color: Color(0xFF300759),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "4:37am    ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          TextSpan(
                            text: "Zuhr ",
                            style: TextStyle(
                              color: Color(0xFF300759),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "12:52pm   ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          TextSpan(
                            text: "Ashr ",
                            style: TextStyle(
                              color: Color(0xFF300759),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "4:30pm  ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Magrib  ",
                            style: TextStyle(
                              color: Color(0xFF300759),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "7:33pm    ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          TextSpan(
                            text: "Isha ",
                            style: TextStyle(
                              color: Color(0xFF300759),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "8:57pm   ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 25),
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
            decoration: BoxDecoration(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Direction",
                  style: TextStyle(color: Color(0xFF300759), fontSize: 18),
                ),
                Icon(Icons.send, color: Color(0xFF7B15BF)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
