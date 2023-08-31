// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Modul/ModulDetail.dart';

void showIosDialog(BuildContext context, String title, String desc,
    String urlImg, String idx, String rating) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text("Information"),
        content: Column(children: [
          Text("Do you want to see more details?"),
        ]),
        actions: [
          CupertinoDialogAction(
            child: Text("Close"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text("Next"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/modulDetail",
                  arguments: ModulDetailArgs(
                      title: title,
                      desc: desc,
                      url: urlImg,
                      idx: idx,
                      rating: rating));
            },
          )
        ],
      );
    },
  );
}
