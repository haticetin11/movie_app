// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:movie_app/views/details.dart';

import '../controllers/trend_movie_controller.dart';
import '../controllers/trend_tv_controller.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

enum _NavigationItem {
  home,
  ticket,
  profile,
}

class _HomeScrenState extends State<HomeScren> {
  int button_index = 0;
  int button_index2 = 0;
  _NavigationItem _currentNavItem = _NavigationItem.home;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetTvDBcontroller());
    final controller2 = Get.put(GetMovieDBcontroller());
    final List<String> imgList = [
      'https://wallpapercave.com/wp/wp11030979.jpg',
      'https://i.pinimg.com/564x/9c/0e/8e/9c0e8ebe80eb781dcd46c0b09c598bcf.jpg',
      'https://i.pinimg.com/564x/24/5f/3b/245f3b966cb5c7263b3cbe2e864168d4.jpg'
    ];
    final List buttonList = [
      'drama',
      'action',
      'romance',
      'comedy',
      'horror',
      'animation',
      'western'
    ];
    final List<Map<String, dynamic>> imgList2 = [
      {
        'movie':
            'https://i.pinimg.com/564x/96/8f/c3/968fc33fde5185ed6002ae9dcca8ca19.jpg',
        'name': 'nobody',
        'watch': '(200k)'
      },
      {
        'movie':
            'https://i.pinimg.com/564x/0b/59/bb/0b59bb9e251ab672c40906dca5ce8868.jpg',
        'name': 'prestige',
        'watch': '(100k)'
      },
      {
        'movie':
            'https://i.pinimg.com/564x/e8/eb/0d/e8eb0d27d7dc341eaf6a566238ae17c5.jpg',
        'name': 'the wolf of wall street',
        'watch': '(79k)'
      },
      {
        'movie':
            'https://i.pinimg.com/564x/3a/c9/6d/3ac96daf6f926e16c6d09e63ace1a46b.jpg',
        'name': 'dune',
        'watch': '(120k)'
      }
    ];
    double width = MediaQuery.of(context).size.width;
    final List<Widget> imageSliders = imgList
        .map((item) => InkWell(
              onTap: () {
                Get.to(Details_screen(),
                    arguments: {'image': item, 'name': 'JOKER'});
              },
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000.0,
                            height: 265,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ))
        .toList();
    final List<Widget> imageSliders2 = imgList2
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item['movie'],
                            fit: BoxFit.cover, width: 300),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 4),
                                child: Text(
                                  item['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 1),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      item['watch'],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 50, 67),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 50, 67),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Chandigarh',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_outlined),
                  ],
                ),
              ],
            ),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.notifications_none_outlined)
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<GetTvDBcontroller>(
              init: GetTvDBcontroller(),
              builder: (diziler) {
                return SizedBox(
                    height: 500,
                    width: Get.width,
                    child: CarouselSlider.builder(
                      itemCount: diziler.tvlist.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        child: ClipRRect(
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w1280${diziler.tvlist[itemIndex].posterPath.toString()}",
                            height: 250,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enableInfiniteScroll: false,
                      ),
                    ));
              },
            ),
            GetBuilder<GetMovieDBcontroller>(
              init: GetMovieDBcontroller(),
              builder: (filmler) {
                return SizedBox(
                    height: 500,
                    width: Get.width,
                    child: CarouselSlider.builder(
                      itemCount: filmler.tvlist.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        child: ClipRRect(
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w1280${filmler.tvlist[itemIndex].posterPath.toString()}",
                            height: 250,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enableInfiniteScroll: false,
                      ),
                    ));
              },
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: false,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Text(
                'Genres',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              width: width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            button_index = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: button_index == index
                              ? Colors.pink
                              : Color.fromARGB(255, 30, 50, 67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: Color.fromARGB(97, 194, 194, 194)),
                          ),
                        ),
                        child: Text(
                          buttonList[index],
                          style: TextStyle(
                            color: button_index == index
                                ? Colors.white
                                : Color.fromARGB(97, 194, 194, 194),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Releases',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.pink, fontSize: 14),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.6,
                enlargeCenterPage: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: false,
              ),
              items: imageSliders2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 30, 50, 67),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentNavItem.index,
        onTap: (int index) {
          setState(() {
            _currentNavItem = _NavigationItem.values[index];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            label: 'ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
