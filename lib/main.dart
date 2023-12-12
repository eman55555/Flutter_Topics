import 'package:flutter/material.dart';
import 'package:flutter_topics/sound_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var fileNames = ["Air", "Alarm", "Birds", "Cat"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[300],
            elevation: 3,
            title: const Text(
              'Flutter Assets Audio Player',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: fileNames.length,
                  itemBuilder: (context, index) => SoundWidget(
                        name: fileNames[index],
                        length: fileNames.length,
                        id: index,
                      ))),
        ));
  }
}
