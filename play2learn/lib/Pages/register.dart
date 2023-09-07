import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:play2learn/Pages/home_page.dart';
import 'login.dart';

import '../components/button.dart';
import '../components/text_field.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Text editing controllers
  final userTextController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obstext = true;

  Future register() async{
    if(userTextController.text == '' || passwordController.text == '' || confirmPasswordController.text == ''){
      Fluttertoast.showToast(
        msg: 'All fields must be filled',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    }else {
      if(passwordController.text == confirmPasswordController.text){
        var url = Uri.parse("https://unreined-squeak.000webhostapp.com/register.php");
        var response = await http.post(url, body: {
          'email': userTextController.text,
          'password': passwordController.text,
        });

        var data = json.decode(response.body);
        if (data == "success") {
          Fluttertoast.showToast(
            msg: 'User created',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );

          Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Page()));
        } else {
          Fluttertoast.showToast(
            msg: 'Error creating user',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        }
      }else {
        Fluttertoast.showToast(
          msg: 'Both passwords must be equal',
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
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50,),

                //welcome back message
                Text(
                  "Lets create an account for you",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 25,),

                //email textfield
                MyTextField(
                    controller: userTextController,
                    hintText: 'User',
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

                const SizedBox(height: 10,),

                //confirm password textfield
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true,
                    icon: Icon(Icons.nat),
                    color: Colors.transparent,
                    onTap: () {},
                ),

                const SizedBox(height: 25,),

                //singin button
                MyButton(
                    onTap: register,
                    text: 'Sing Up'
                ),

                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.grey[700]
                      ),
                    ),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login here',
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