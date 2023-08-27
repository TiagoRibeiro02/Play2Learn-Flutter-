import 'package:flutter/material.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home_Page(),
      },
    )
  );
}

