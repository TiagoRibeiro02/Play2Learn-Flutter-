import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:play2learn/Pages/PagesStudents/groups_page.dart';
import 'package:play2learn/Pages/PagesStudents/home_page_student.dart';
import 'package:play2learn/Pages/logout_page.dart';
import 'package:play2learn/Pages/PagesStudents/profile_page.dart';
import 'package:play2learn/Pages/PagesStudents/settings_page.dart';

class PageControllerStudents extends StatefulWidget {
  const PageControllerStudents({super.key});

  @override
  State<PageControllerStudents> createState() => _PageControllerStudentsState();
}

class _PageControllerStudentsState extends State<PageControllerStudents> {

  int index = 2;

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
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[300] as Color,
        color: Colors.cyan[800] as Color,
        buttonBackgroundColor: Colors.deepOrange[400],
        animationDuration: const Duration(milliseconds: 400),
        index: 2,
        onTap: (index)=> setState(() {
          this.index = index;
          print(index);
        }),
        items: [
          Icon(Icons.person, color: Colors.grey[300]),
          Icon(Icons.groups, color: Colors.grey[300]),
          Icon(Icons.gamepad, color: Colors.grey[300]),
          Icon(Icons.settings, color: Colors.grey[300]),
          Icon(Icons.logout, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
