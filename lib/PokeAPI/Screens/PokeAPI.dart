// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/PokeAPI/Screens/PokeAPIManual.dart';

class PokeAPIScreen extends StatefulWidget {
  @override
  State<PokeAPIScreen> createState() => _PokeAPIScreenState();
}

class _PokeAPIScreenState extends State<PokeAPIScreen> {
  int selectedIndex = 0;
  List<String> title = ["PokeApi Manual", "PokeApi Block"];
  List<Widget> widgetScreen = [PokeAPIManual(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(title[selectedIndex]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: widgetScreen.elementAt(selectedIndex),
    );
  }

  void onTapBar(int idx) {
    setState(() {
      selectedIndex = idx;
    });
  }
}
