// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NetflixScreen extends StatelessWidget {
  List<String> imgBanner = [
    "https://en.gundam.info/about-gundam/series-pages/witch/gwitch/en/news/2022/07/220617_gw_1280px_720px_banner_english.jpg",
    "https://www.horrornewsnetwork.net/wp-content/uploads/2021/02/Wednesday-Netflix.jpg",
    "https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2022/12/bleach-banner.jpg?q=50&fit=contain&w=1140&h=570&dpr=1.5",
    "http://www.otakuattack.org/wp-content/uploads/2018/12/MHA-Banner2.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111c2f),
      appBar: AppBar(
        backgroundColor: Color(0xFF111c2f),
        title: Text(
          "Netflix",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider.builder(
          itemCount: imgBanner.length,
          itemBuilder: ((context, index, realIndex) {
            return Center(
              child: Image.network(
                imgBanner[index],
                height: 180,
                fit: BoxFit.cover,
              ),
            );
          }),
          options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                height: 45,
                child: Text("On Going"),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: 45,
                child: Text("Coming Soon"),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
