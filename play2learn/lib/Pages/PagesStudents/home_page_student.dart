import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play2learn/Pages/PagesStudents/groups_page.dart';
import 'package:play2learn/Pages/logout_page.dart';
import 'package:play2learn/Pages/PagesStudents/profile_page.dart';
import 'package:play2learn/Pages/PagesStudents/settings_page.dart';

class Home_Page_Student extends StatefulWidget {
  const Home_Page_Student({super.key});

  @override
  State<Home_Page_Student> createState() => _Home_Page_StudentState();
}

class _Home_Page_StudentState extends State<Home_Page_Student> {

  final screens = [
    ProfilePage(),
    GroupsPage(),
    Home_Page_Student(),
    SettingsPage(),
    LogoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],


      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 70.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Center(
                  child: Lottie.asset(
                      'assets/animation_brain.json',
                      repeat: false,
                      height: 250,
                      width: 250,
                      animate: false
                  ),
                ),

                const SizedBox(height: 20,),

                //title
                Text(
                  "Play2learn",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0

                  ),
                ),

                const SizedBox(height: 5,),

                //message
                Text(
                  "I'm really bright",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0
                  ),
                ),

                const SizedBox(height: 70,),

                //play button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: ElevatedButton(
                      onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      backgroundColor: Colors.cyan[800],
                      padding: const EdgeInsets.symmetric(vertical: 8.0)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.deepOrange[400],
                            size: 30.0,
                          ),

                          const SizedBox(width: 10.0,),

                          const Text(
                              'PLAY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                  ),
                ),

                const SizedBox(height: 70,),

                //message
                Center(
                  child: Text(
                    "The game that will make you master any subject",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}