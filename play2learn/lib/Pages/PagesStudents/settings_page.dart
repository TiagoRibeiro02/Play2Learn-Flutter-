import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Center(
                  child: Lottie.asset(
                      'assets/cogwheel.json',
                      repeat: false,
                      height: 250,
                      width: 250,
                      animate: false
                  ),
                ),

                const SizedBox(height: 20,),

                //title
                Text(
                  "Language",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                  ),
                ),

                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),

                //listview com linguas
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  height: 300,
                  width: MediaQuery. of(context). size. width,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: SingleChildScrollView(  //TODO alterar para uma listview com uma lista da db
                    child: Text(
                      'a',
                      style: const TextStyle(
                          fontSize: 17.0
                      ),),
                  ),
                ),

                const SizedBox(height: 20,),

                //title
                Text(
                  "Account",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),

                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
