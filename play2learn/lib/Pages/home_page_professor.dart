import 'package:flutter/material.dart';

class Home_Page_Professor extends StatefulWidget {
  const Home_Page_Professor({super.key});

  @override
  State<Home_Page_Professor> createState() => _Home_Page_ProfessorState();
}

class _Home_Page_ProfessorState extends State<Home_Page_Professor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prof'),
      ),
    );
  }
}
