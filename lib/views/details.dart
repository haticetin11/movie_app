// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Details_screen extends StatefulWidget {
  const Details_screen({super.key});

  @override
  State<Details_screen> createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgCast = [
      'https://www.biyografi.net.tr/wp-content/uploads/2017/10/joaquin-phoenix-kimdir.jpg',
      'https://cdn.britannica.com/74/229374-050-25308CF5/Jared-Leto-House-of-Gucci-UK-premiere-2021.jpg',
      'https://media1.popsugar-assets.com/files/thumbor/UYPKwp0gCaFUKrX04Z7rnXBEXJE/0x143:2328x2471/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2020/06/01/723/n/1922398/81b56a6b5ed52af67705f4.67925491_/i/Amanda-Peet.jpg',
      'https://www.biyografi.net.tr/wp-content/uploads/2017/10/joaquin-phoenix-kimdir.jpg',
      'https://cdn.britannica.com/74/229374-050-25308CF5/Jared-Leto-House-of-Gucci-UK-premiere-2021.jpg',
      'https://media1.popsugar-assets.com/files/thumbor/UYPKwp0gCaFUKrX04Z7rnXBEXJE/0x143:2328x2471/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2020/06/01/723/n/1922398/81b56a6b5ed52af67705f4.67925491_/i/Amanda-Peet.jpg'
    ];

    var data = Get.arguments;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 50, 67),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  data['image'],
                  width: Get.width,
                  height: Get.height / 2.2,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 245,
                  bottom: 0,
                  left: 100,
                  child: Text(
                    data['name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
                Positioned(
                    left: 15,
                    top: 30,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 310),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Adventure,Fantasy ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'English ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' 2h 23m ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' |',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' 8 Apr 2022',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(76, 174, 174, 174),
                  ),
                  Text(
                    '(99k)',
                    style: TextStyle(color: Color.fromARGB(125, 255, 255, 255)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 290, top: 10),
              child: Text(
                'Summary',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 15),
              child: Text(
                'Arthur Fleck, a party clown,leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak,he decides..',
                style: TextStyle(color: Color.fromARGB(147, 185, 182, 182)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 333, top: 20, bottom: 15),
              child: Text('Cast',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgCast.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(imgCast[index]),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Actor $index',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
