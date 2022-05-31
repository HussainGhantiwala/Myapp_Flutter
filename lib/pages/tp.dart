import 'package:flutter/material.dart';

class TimePass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(hintText: "TextField 1"),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(hintText: "TextField 2"),
        ),
      ),
    ]));
  }
}
