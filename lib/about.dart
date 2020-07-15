import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      
      child: Center(
        child: Text(
          "About",
          style: TextStyle(color: Color(0xff8899A6), fontSize: 12),
        ),
      ),
    );
  }
}
