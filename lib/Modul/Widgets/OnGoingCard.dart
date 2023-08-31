// ignore_for_file: prefer_const_constructors, annotate_overrides, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Modul/Widgets/IosDialog.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OnGoingCard extends StatelessWidget {
  String title;
  String desc;
  String rating;
  String img;
  String idx;

  OnGoingCard(
      {required this.title,
      required this.desc,
      required this.img,
      required this.idx,
      required this.rating});

  Widget build(BuildContext context) {
    print('RATING ${rating}');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TitleStyle(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: DescStyle(),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: double.parse(rating),
                    itemSize: 25,
                    ignoreGestures: true,
                    itemBuilder: (context, i) => Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    onRatingUpdate: (value) {},
                  ),
                  GestureDetector(
                    onTap: () =>
                        showIosDialog(context, title, desc, img, idx, rating),
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
