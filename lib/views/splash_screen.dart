import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_topics/views/home_screen.dart';
import 'package:flutter_topics/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   // checkUserStatus();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )));
  }
}
