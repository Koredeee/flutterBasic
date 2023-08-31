// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Modul/Widgets/WebViewDialog.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';

class ComingSoonCard extends StatelessWidget {
  String title;
  String img;

  ComingSoonCard({required this.title, required this.img});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                height: 200,
              ),
            ),
            Expanded(
                child: Padding(
              // padding: EdgeInsets.only(left: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TitleStyle(),
                  ),
                  Padding(
                    // padding: EdgeInsets.only(left: 30),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: DescStyle(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showWebviewDialog(context, title,
                          "https://www.youtube.com/watch?v=mYd_l3E7yOc");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF638cef),
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        "Lihat Detail",
                        style: DescStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
