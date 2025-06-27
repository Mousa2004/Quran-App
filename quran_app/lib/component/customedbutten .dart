import 'package:flutter/material.dart';

class Customedbutton extends StatelessWidget {
  final String name;
  final void Function()? onPressed;
  const Customedbutton({super.key, required this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 100, right: 100),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Color(0xFFF0DCFA),

        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: Color(0xFFBE87E6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
