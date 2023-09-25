import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:play2learn/Components/bio_text_field.dart';
import 'package:play2learn/Pages/PagesStudents/profile_page.dart';
import 'package:play2learn/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../../Components/button2.dart';
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
  final imagePicker = ImagePicker();
  File? imageFile;


  Future update() async{
    var url = Uri.parse("https://unreined-squeak.000webhostapp.com/updateInfo.php");
    var response = await http.post(url, body: {
      'originalemail': UserPreferences.getEmail(),
      'email': emailTextController.text,
      'username': usernameTextController.text,
      'biblio': bioTextController.text,
    });

    var data = json.decode(response.body);
    String dataText = data.toString();

    print(dataText);
  }

  pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  //TODO: save image in db

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey[900],),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));},),
        title: Text('Edit Profile', style: TextStyle(color: Colors.grey[900]),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                      imageFile != null ? FileImage(imageFile!) : null,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        onPressed: _showOpcoesBottomSheet,
                        icon: Icon(
                          PhosphorIcons.regular.pencilSimple,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),

              const SizedBox(height: 60,),

              MyTextField(
                controller: usernameTextController,
                hintText: UserPreferences.getUsername(),
                obscureText: false,
                icon: const Icon(Icons.nat),
                color: Colors.transparent,
                onTap: () {},
              ),

              const SizedBox(height: 10,),

              MyTextField(
                controller: emailTextController,
                hintText: UserPreferences.getEmail(),
                obscureText: false,
                icon: const Icon(Icons.nat),
                color: Colors.transparent,
                onTap: () {},
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

              const SizedBox(height: 40,),

              Button2(
                  onTap: update,
                  text: 'Save',
                  color: Colors.deepOrange[400]
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  void _showOpcoesBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.image,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // search image in the gallery
                  pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.camera,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Take a photo
                  pick(ImageSource.camera);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      PhosphorIcons.regular.trash,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                title: Text(
                  'Remove',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // remove image
                  setState(() {
                    imageFile = null;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
