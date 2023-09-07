import 'package:flutter/material.dart';

import '../Pages/login.dart';
import '../Pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initialy, show login page
  bool showLoginPage = true;

  //toggle page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return Login(onTap: togglePages);
    } else{
      return Register(onTap: togglePages);
    }
  }
}