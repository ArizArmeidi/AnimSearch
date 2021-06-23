import 'package:flutter/material.dart';

import 'package:anim_search/screens/home_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        primaryColor: Colors.white,
        accentColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
