import 'package:flutter/material.dart';
import 'package:play2learn/Pages/login.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login(onTap: () {}),
      },
    )
  );
}

