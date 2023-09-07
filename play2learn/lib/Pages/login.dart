import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:play2learn/Pages/home_page.dart';
import 'package:lottie/lottie.dart';

import '../Components/button.dart';
import '../Components/text_field.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  //Text editing controllers
  final userTextController = TextEditingController();
  final passwordController = TextEditingController();

  bool obstext = true;

  Future singIn() async {

    if(userTextController.text == '' || passwordController.text == ''){
      Fluttertoast.showToast(
        msg: 'Fields must be filled',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    }else {
      var url = Uri.parse("https://unreined-squeak.000webhostapp.com/db.php");
      var response = await http.post(url, body: {
        'email': userTextController.text,
        'password': passwordController.text,
      });

      var data = json.decode(response.body);
      if (data == "success") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home_Page()));
      } else {
        Fluttertoast.showToast(
          msg: 'The user or password are wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
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

                const SizedBox(height: 40,),

                //welcome back message
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 25,),

                //email textfield
                MyTextField(
                    controller: userTextController,
                    hintText: 'Email',
                    obscureText: false,
                    icon: Icon(Icons.nat),
                    color: Colors.transparent,
                    onTap: () {},
                ),

                const SizedBox(height: 10,),

                //password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: obstext,
                    icon: Icon(Icons.remove_red_eye),
                    color: Colors.grey,
                    onTap: () {
                      setState(() {
                        obstext = !obstext;
                      });
                    },
                ),

                const SizedBox(height: 25,),

                //singin button
                MyButton(
                    onTap: singIn,
                    text: 'Sing In'),

                const SizedBox(height: 10,),

                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          color: Colors.grey[700]
                      ),
                    ),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
