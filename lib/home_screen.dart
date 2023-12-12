import 'package:flutter/material.dart';

import 'components/sound_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fileNames = ["Air", "Alarm", "Birds", "Cat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 3,
        title: const Text(
          'Flutter Assets Audio Player',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
