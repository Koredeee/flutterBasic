// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';

class HeaderName extends StatelessWidget {
  String greeting;
  String name;
  String imgProfile;

  HeaderName(
      {required this.greeting, required this.name, required this.imgProfile});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting, style: HeaderStyle()),
                Text(name, style: NameStyle()),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 199, 204),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              imgProfile,
              scale: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
