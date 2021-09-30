import 'package:flutter/material.dart';
import 'package:swiper/Data.dart';
import 'package:swiper/constant.dart';

class DaitailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  const DaitailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Solar System',
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: contentTextColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(planetInfo.description,
                              maxLines: 5,
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: contentTextColor,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('Gallery',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: planetInfo.images.length,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  right: -64,
                  child: Hero(
                      tag: planetInfo.position,
                      child: Image.asset(planetInfo.iconImage))),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 300,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
