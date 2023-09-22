import 'package:flutter/material.dart';
import 'package:play2learn/Components/bio_text_field.dart';
import 'package:play2learn/utils/shared_prefs.dart';

import '../../Components/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final emailTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final bioTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.grey[900],),
        title: Text('Edit Profile', style: TextStyle(color: Colors.grey[900]),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              MyTextField(
                controller: usernameTextController,
                hintText: UserPreferences.getUsername(),
                obscureText: false,
                icon: const Icon(Icons.nat),
                color: Colors.transparent,
                onTap: () {},
              ),

              const SizedBox(height: 10,),

              //password text-field
              MyTextField(
                controller: emailTextController,
                hintText: UserPreferences.getEmail(),
                obscureText: false,
                icon: const Icon(Icons.remove_red_eye),
                color: Colors.transparent,
                onTap: () {}
              ),

              const SizedBox(height: 10,),

              BioTextField(
                  controller: bioTextController,
                  hintText: UserPreferences.getBio() == ''? 'Include Bio' : UserPreferences.getBio(),
                  icon: const Icon(Icons.nat),
                  color: Colors.transparent,
                  onTap: () {},
                  obscureText: false,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
