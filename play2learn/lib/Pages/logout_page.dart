import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:play2learn/Components/button2.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {

  void logout() {
    Navigator.popAndPushNamed(context, '/');
    //TODO: apagar a conta que estiver nas shared preferences
  }

  static Future<void> exit({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 70.0),
          child: Center(
            child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //logo
                      Center(
                        child: Lottie.asset(
                            'assets/animation_brain.json',
                            repeat: false,
                            height: 250,
                            width: 250,
                            animate: false
                        ),
                      ),

                      const SizedBox(height: 10,),

                      //Goodbye message
                      Text(
                        "See you again soon!",
                        style: TextStyle(
                          color: Colors.grey[700],
                            fontSize: 17.0
                        ),
                      ),

                      const SizedBox(height: 80,),

                      Button2(
                          onTap: logout,
                          text: 'Logout',
                          color: Colors.cyan[900],
                      ),

                      const SizedBox(height: 30,),

                      Button2(
                          onTap: exit,
                          text: 'Exit',
                          color: Colors.deepOrange[700],
                      ),

                ]),
          ),
        ),
      ),
    );
  }
}
