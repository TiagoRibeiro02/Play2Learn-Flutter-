import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home_Page_Professor extends StatefulWidget {
  const Home_Page_Professor({super.key});

  @override
  State<Home_Page_Professor> createState() => _Home_Page_ProfessorState();
}

class _Home_Page_ProfessorState extends State<Home_Page_Professor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Lottie.asset(
                    'assets/animation_brain.json',
                    repeat: false,
                    height: 250,
                    width: 250,
                    animate: false
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
