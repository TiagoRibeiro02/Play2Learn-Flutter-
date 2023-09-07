import 'package:flutter/material.dart';
import 'package:play2learn/Auth/login_or_register.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginOrRegister(),
      },
    )
  );
}

