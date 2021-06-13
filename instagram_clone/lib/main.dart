import "package:flutter/material.dart";
import 'package:instagram_clone/screen/main_screen.dart';
import 'package:instagram_clone/screen/comments_screen.dart';
import 'package:instagram_clone/screen/splash_screen.dart';

import 'screen/bottom_navigation.dart';
import 'screen/myposts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:

          //  Myposts()

          // BottomNavigation()

          // MainScreen(),

      SplashScreen(),
    );
  }
}
