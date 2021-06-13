import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screen/main_screen.dart';

import 'bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // MainScreen mainscreen = MainScreen();

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigation()));
    });

    // mainscreen._bottomSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: Center(
                  child: SvgPicture.asset(
                "assets/logo.svg",
                height: 105,
                width: 105,
              ))),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "from",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "FACEBOOK",
                  style:
                      TextStyle(letterSpacing: 4, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
