import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    const ProfilePage(),
    const GroupsPage(),
    const Home_Page_Student(),
    const SettingsPage(),
    const LogoutPage(),
  ];

  static Future<void> exit({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => exit(), // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey[300] as Color,
          color: Colors.cyan[800] as Color,
          buttonBackgroundColor: Colors.deepOrange[400],
          animationDuration: const Duration(milliseconds: 400),
          index: 2,
          onTap: (index)=> setState(() {
            this.index = index;
          }),
          items: [
            Icon(Icons.person, color: Colors.grey[300]),
            Icon(Icons.groups, color: Colors.grey[300]),
            Icon(Icons.gamepad, color: Colors.grey[300]),
            Icon(Icons.settings, color: Colors.grey[300]),
            Icon(Icons.logout, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}
