import 'package:flutter/material.dart';
import 'package:play2learn/utils/shared_prefs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: 120, height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage(''),)),
                ),
                const SizedBox(height: 10,),
                Text(UserPreferences.getUsername()),
                Text(UserPreferences.getEmail()),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
