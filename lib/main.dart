// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Dashboard/Dashboard.dart';
import 'package:flutter_basic_pp/Modul/Modul.dart';
import 'package:flutter_basic_pp/Modul/ModulDetail.dart';
import 'package:flutter_basic_pp/Netflix/Netflix.dart';
import 'package:flutter_basic_pp/PokeAPI/Screens/PokeAPI.dart';
import 'package:flutter_basic_pp/PokeAPI/Screens/PokeAPIDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var routes = {
    "/netflix": (context) => NetflixScreen(),
    "/modul": (context) => ModulScreen(),
    "/modulDetail": (context) => ModulDetail(),
    "/pokeapi": (context) => PokeAPIScreen(),
    "/PokeAPIDetail": (context) => PokeAPIDetail(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: routes,
      home: Dashboard(),
    );
  }
}
