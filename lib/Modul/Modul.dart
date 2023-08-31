// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Modul/Widgets/ComingSoonCard.dart';
import 'package:flutter_basic_pp/Modul/Widgets/OnGoingCard.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ModulScreen extends StatefulWidget {
  @override
  State<ModulScreen> createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  List<String> imgBanner = [
    "https://en.gundam.info/about-gundam/series-pages/witch/gwitch/en/news/2022/07/220617_gw_1280px_720px_banner_english.jpg",
    "https://www.horrornewsnetwork.net/wp-content/uploads/2021/02/Wednesday-Netflix.jpg",
    "https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2022/12/bleach-banner.jpg?q=50&fit=contain&w=1140&h=570&dpr=1.5",
    "http://www.otakuattack.org/wp-content/uploads/2018/12/MHA-Banner2.jpg"
  ];

  Color btnOngoing = Colors.yellow;

  Color btnComing = Colors.white;

  bool visOnGoing = true;

  bool visComing = false;

  List<String> titleOnGoing = ["Wednesday", "Gundam Wings", "Spy x Family"];

  List<String> titleComing = [
    "Gundam Suit Mercury",
    "Full Metal Alche",
    "Bleach",
    "First Love"
  ];

  List<String> imgComing = [
    "assets/gundam2.jpg",
    "assets/fullmetal.jpg",
    "assets/bleach.jpg",
    "assets/first_love.jpg"
  ];

  List<String> imgGoing = [
    "assets/wednesday.jpg",
    "assets/gundam.jpg",
    "assets/spyxfamily.jpg"
  ];

  List<String> descGoing = [
    "A sleuthing, supernaturally infused mystery charting Wednesday Addams' years as a student at Nevermore Academy. Wednesday's attempts to master her emerging psychic ability, thwart a monstrous killing spree that has terrorized the local town, and solve the supernatural mystery that embroiled her parents 25 years ago - all while navigating her new and very tangled relationships at Nevermore.",
    "The United Earth Sphere Alliance is a powerful military organization that has ruled over Earth and space colonies with an iron fist for several decades. When the colonies proclaimed their opposition to this, their leader was assassinated. Now, in the year After Colony 195, bitter colonial rebels have launched 'Operation Meteor', sending five powerful mobile suits to Earth for vengeance. Built out of virtually indestructible material called Gundanium Alloy, these 'Gundams' begin an assault against the Alliance and its sub organization OZ.",
    "The Westalis Intelligence Services' Eastern-Focused Division (WISE) sends their most talented spy, 'Twilight,' on a top-secret mission to investigate the movements of Donovan Desmond, the chairman of Ostania's National Unity Party, who is threatening peace efforts between the two nations."
  ];

  List<String> ratingValList = [];

  final storageCache = FlutterSecureStorage();
  String initialVal = "0";

  @override
  void initState() {
    super.initState();
    getValBar();
  }

  void getValBar() async {
    String ratingBar = await storageCache.read(key: "rating_value") ?? "0.0";
    print("RATING BAR $ratingBar");
    setState(() {
      ratingValList = ratingBar.split(",");
      if (ratingValList.length < imgGoing.length) {
        ratingValList.add("0.0");
        ratingValList.add("0.0");
      } else {
        ratingValList.toList();
      }
      print("LENGTH RATING MODUL ${ratingValList.length}");
      print("LENGTH RATING MODUL ${ratingValList}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111c2f),
      appBar: AppBar(
        backgroundColor: Color(0xFF111c2f),
        title: Text(
          "Modul",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  btnComing = Colors.white;
                  btnOngoing = Colors.yellow;
                  visOnGoing = true;
                  visComing = false;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: btnOngoing,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                height: 45,
                child: Text(
                  "On Going",
                  style: DescBoldStyle(),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  btnOngoing = Colors.white;
                  btnComing = Colors.yellow;
                  visComing = true;
                  visOnGoing = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: btnComing,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: 45,
                child: Text("Coming Soon", style: DescBoldStyle()),
              ),
            ),
          ],
        ),
        for (var i = 1; i <= imgGoing.length; i++)
          Visibility(
              visible: visOnGoing,
              child: OnGoingCard(
                title: titleOnGoing[i - 1],
                desc: descGoing[i - 1],
                img: imgGoing[i - 1],
                idx: "${i - 1}",
                rating: ratingValList[i - 1],
              )),
        for (var j = 1; j <= imgComing.length; j++)
          Visibility(
              visible: visComing,
              child: ComingSoonCard(
                  title: titleComing[j - 1], img: imgComing[j - 1]))
      ]),
    );
  }
}
