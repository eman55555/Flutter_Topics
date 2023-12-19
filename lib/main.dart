import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_topics/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/home_screen.dart';
import 'services/preferences.services.dart';




void main() async  {

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));
   
   PreferencesService.prefs = await SharedPreferences.getInstance();
    var email = PreferencesService.prefs!.getString("email");
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

  
