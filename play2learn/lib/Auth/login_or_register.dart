import 'package:flutter/material.dart';
import 'package:play2learn/Auth/professor_or_student.dart';
import 'package:play2learn/utils/shared_prefs.dart';

import '../Pages/login.dart';
import '../Pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially, show login page
  bool showLoginPage = true;
  bool sharedprefexist = false;
  String user = '';
  String role = '';

  Future prefscheck() async{
    user = UserPreferences.getUsername();
    role = UserPreferences.getRole();

    if(user != ''){
      setState(() {
        sharedprefexist = true;
      });
    } else{
      setState(() {
        sharedprefexist = false;
      });
    }
  }

  //toggle page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context){
    prefscheck();
    if(sharedprefexist){
      return ProfessorOrStudent(role: role);
    }else{
      if (showLoginPage){
        return Login(onTap: togglePages);
      } else{
        return Register(onTap: togglePages);
      }
    }
  }
}