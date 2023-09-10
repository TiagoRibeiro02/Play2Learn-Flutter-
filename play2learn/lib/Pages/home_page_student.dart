import 'package:flutter/material.dart';

class Home_Page_Student extends StatefulWidget {
  const Home_Page_Student({super.key});

  @override
  State<Home_Page_Student> createState() => _Home_Page_StudentState();
}

class _Home_Page_StudentState extends State<Home_Page_Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('student'),
      ),
    );
  }
}