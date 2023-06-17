import 'dart:math';

import 'package:flutter/material.dart';

import '../../widgets/home_widgets/CustomCarousel.dart';
import '../../widgets/home_widgets/emergency.dart';
import '../../widgets/home_widgets/safehome/SafeHome.dart';
import '../../widgets/livesafe.dart';
import '../Articles/AllArticles.dart';
import '../custom_appBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quoteIndex = 0;
  @override
  void initState() {
    super.initState();
    getRandomInt(false);
  }

  getRandomInt(fromClick) {
    Random rnd = Random();

    quoteIndex = rnd.nextInt(4);
    if (mounted && fromClick) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            getRandomInt: getRandomInt,
            quoteIndex: quoteIndex,
          ),
          Expanded(
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Emergency",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllArticles(),
                              ),
                            );
                          },
                          child: Text("See More"),
                        ),
                      ],
                    ),
                  ),
                  Emergency(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 10, top: 10),
                    child: Text(
                      "Explore Nearby Locations",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  LiveSafe(),
                  SafeHome(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
