import 'package:flutter/material.dart';
import 'package:play2learn/Auth/login_or_register.dart';
import 'package:play2learn/utils/shared_prefs.dart';

import 'Pages/home_page_professor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginOrRegister(),
      },
    )
  );
}

