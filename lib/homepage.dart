import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:swiper/Data.dart';
import 'package:swiper/constant.dart';
import 'package:swiper/detailpage.dart';

class HomePge extends StatefulWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  _HomePgeState createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                "Explore",
                style: TextStyle(
                    fontSize: 44,
                    fontFamily: 'Avenir',
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'Solar System',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color(0x7cdbf1ff),
                          fontFamily: 'Avenir'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
                // onChanged: (value) {},
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('images/drop.png'),
                ),
                underline: SizedBox(),
              ),
            ),
            Container(
                height: 600,
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(activeSize: 20)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DaitailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Solar System',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Know more',
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: secondaryTextColor),
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: Color(0xFFE4979E))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Hero(
                              tag: planets[index].position,
                              child: Image.asset(
                                planets[index].iconImage,
                                height: 300,
                                width: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 200, vertical: 160),
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 100,
                                  color: primaryTextColor.withOpacity(0.2),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
