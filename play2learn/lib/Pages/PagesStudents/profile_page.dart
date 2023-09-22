import 'package:flutter/material.dart';
import 'package:play2learn/Components/button2.dart';
import 'package:play2learn/Pages/PagesStudents/edit_profile_page.dart';
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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 70.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 120, height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage('assets/user.png'),)), //TODO: mudar se user tiver img
                  ),
                  const SizedBox(height: 20,),
                  Text(UserPreferences.getUsername(),
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0

                    ),),
                  const SizedBox(height: 5,),
                  Text(UserPreferences.getEmail(),
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0
                    ),),
                  const SizedBox(height: 30,),

                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    height: 300,
                    width: MediaQuery. of(context). size. width,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        UserPreferences.getBio(),
                        style: const TextStyle(
                          fontSize: 17.0
                      ),),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Button2(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));},
                      text: 'Edit Profile',
                      color: Colors.deepOrange[400]
                  ),

                  //TODO: add horizontal scrollview of classmates
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
