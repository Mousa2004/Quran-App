import 'package:flutter/material.dart';
import 'package:quran_app/buttonavigationpage.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
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
                    "Notification",
                    style: TextStyle(
                      color: Color(0xFF300759),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Color(0xFF300759),
                  ),
                ),
              ],
            ),
            Image.asset("images/notimg.png"),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 130,
              width: 500,
              padding: EdgeInsets.only(left: 5, top: 10),
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Dont miss salah !! ",
                          style: TextStyle(
                            color: Color(0xFF300759),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "2 hour ago"),
                      ],
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      "Its time for zuhr and dont miss the reward forpreyzing zuhr benefits of praying zuhr prayer continue reading...",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 100,
              width: 500,
              padding: EdgeInsets.only(left: 5, top: 10),
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Today's task !! ",
                          style: TextStyle(
                            color: Color(0xFF300759),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "4 hour ago"),
                      ],
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      "Its time for zuhr and dont miss the reward forpreyzing zuhr..",
                      style: TextStyle(fontSize: 15),
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
