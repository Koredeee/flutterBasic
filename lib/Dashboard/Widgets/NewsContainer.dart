// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewsContainer extends StatelessWidget {
  String title;
  String img;
  double ratingStar;
  String numPeople;
  String subTitle;
  String desc;

  NewsContainer(
      {required this.img,
      required this.title,
      required this.ratingStar,
      required this.numPeople,
      required this.subTitle,
      required this.desc});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(img),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SubHeaderStyle(),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      itemBuilder: (context, i) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (value) {},
                      initialRating: ratingStar,
                      allowHalfRating: true,
                      itemSize: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        numPeople,
                        style: SmallStyle(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    subTitle,
                    style: TitleStyle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
