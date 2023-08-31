// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';

class AppContainer extends StatelessWidget {
  final String logoAsset;
  final String appName;
  final String routes;
  final Color backgroundColor;

  const AppContainer(
      {required this.logoAsset,
      required this.appName,
      required this.routes,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routes);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(logoAsset, height: 60),
              ),
              Text(
                appName,
                style: TitleStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
