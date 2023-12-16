import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_topics/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/home_screen.dart';





void main() async  {

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));

  var prefrenceInstance = await SharedPreferences.getInstance();
    var email =prefrenceInstance.getString("email");
    //print(prefrenceInstance.getString("email"));
      FlutterNativeSplash.remove();
  runApp( MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:email != null ?  const HomeScreen() : LoginScreen()));
}

  
