// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_basic_pp/Dashboard/Widgets/HeaderName.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';
import 'package:flutter_basic_pp/Dashboard/Widgets/AppContainer.dart';
import 'package:flutter_basic_pp/Dashboard/Widgets/NewsContainer.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> titleNews = [
    "A New Era of Communication",
    "Navigating the New Normal",
    "A Path to Redefining Travel"
  ];

  List<String> imgNews = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg"
  ];

  List<double> ratingNews = [4.5, 3.5, 5];

  List<String> numNews = ["(210)", "(100)", "(550)"];

  List<String> subtitleNews = [
    "Virtual Reality Meetings",
    "Adapting to Hybrid Work",
    "Sustainable Tourism"
  ];

  List<String> descNews = [
    "With the rise of virtual reality technology, communication is undergoing a revolutionary transformation. Virtual reality meetings offer immersive environments where participants can interact as if they were physically present. This advancement is breaking down geographical barriers, enabling seamless collaboration among teams worldwide. From boardrooms to classrooms, virtual reality is reshaping the way we connect and communicate.",
    "As the workplace evolves, so do work behaviors. The shift to hybrid work models, combining remote and in-office setups, presents both opportunities and challenges. Employees are learning to strike a balance between the flexibility of remote work and the productivity benefits of in-person collaboration. This transition necessitates a reevaluation of time management, communication skills, and self-motivation, highlighting the importance of adaptable work behaviors in this new normal.",
    "Travel is undergoing a transformative journey towards sustainability. With growing awareness of environmental impacts, travelers are seeking eco-friendly alternatives and destinations that prioritize conservation and local communities. From carbon-neutral accommodations to responsible wildlife experiences, sustainable tourism is reshaping the industry. This movement encourages a deeper connection with cultures, fosters environmental stewardship, and paves the way for a more responsible way of exploring our planet.",
  ];

  Widget menuRow(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TitleStyle(),
          ),
        ),
        Image.asset("assets/filter.png"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5e5e5),
      // appBar: AppBar(title: Text("Home")),
      // drawer: SafeArea(child: Drawer()),
      body: SafeArea(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              HeaderName(
                  greeting: "Good Evening!",
                  name: "Elizabeth",
                  imgProfile: "assets/my_profile.png"),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: menuRow("Menu"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppContainer(
                    logoAsset: "assets/logo_netflix.png",
                    appName: "Neflix",
                    routes: "/netflix",
                    backgroundColor: Colors.black,
                  ),
                  AppContainer(
                    logoAsset: "assets/pokeapi.png",
                    appName: "PokeAPI",
                    routes: "/pokeapi",
                    backgroundColor: Colors.yellow,
                  ),
                  AppContainer(
                    logoAsset: "assets/download.jpeg",
                    appName: "Modul",
                    routes: "/modul",
                    backgroundColor: Color(0xFF0c8a31),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: menuRow("New's"),
              ),
              for (var i = 1; i <= imgNews.length; i++)
                NewsContainer(
                    img: imgNews[i - 1],
                    title: titleNews[i - 1],
                    ratingStar: ratingNews[i - 1],
                    numPeople: numNews[i - 1],
                    subTitle: subtitleNews[i - 1],
                    desc: descNews[i - 1])
            ],
          ),
        ),
      ),
    );
  }
}
