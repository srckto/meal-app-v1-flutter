import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Text(
          "This page is empty.",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
