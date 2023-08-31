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
      appBar: AppBar(
        title: Text(title[selectedIndex]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.list,
                color: Colors.brown,
              ),
              label: "Manual",
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.brown,
              ),
              label: "Bloc",
              icon: Icon(
                Icons.dashboard,
                color: Colors.grey,
              )),
        ],
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
