// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodeca/Components/main_screen.dart';

class StartingScreen extends StatelessWidget {
  StartingScreen({Key? key}) : super(key: key);

  static const black = Color.fromARGB(255, 28, 28, 30);

  var grey = const Color.fromARGB(255, 174, 175, 175);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCustomTextWidget(
              title: "FOODECA",
              color: black,
              fontSize: 28.0,
              fonwWeight: FontWeight.bold,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 40),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    left: -90,
                    child: Column(
                      children: [
                        getCustomTiltedImage(
                          imagePath: "assets/Images/noodles.jpg",
                          radius: 50.0,
                        ),
                        const SizedBox(height: 30),
                        getCustomTiltedImage(
                          imagePath: "assets/Images/pizza-slice.jpg",
                          radius: 90.0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Column(
                        children: [
                          getCustomTiltedImage(
                            imagePath: "assets/Images/bowl-noodles.jpg",
                            radius: 90.0,
                          ),
                          const SizedBox(height: 20),
                          getCustomTiltedImage(
                            imagePath: "assets/Images/sushi1.jpg",
                            radius: 60.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -90,
                    child: Column(
                      children: [
                        getCustomTiltedImage(
                          imagePath: "assets/Images/burger.jpg",
                          radius: 60.0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getCustomTiltedImage(
                          imagePath: "assets/Images/burrito.jpg",
                          radius: 100.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: getCustomTextWidget(
                  title: 'Choose your preference', color: grey, fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            getCustomTextWidget(
                title: "What's Your",
                color: black,
                fontSize: 32.0,
                fonwWeight: FontWeight.bold),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: getCustomTextWidget(
                title: "favorite food?",
                color: grey,
                fontSize: 32.0,
                fonwWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ))),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                decoration: const BoxDecoration(),
                child: const Text('Get started'),
              ),
            )
          ],
        ),
      ),
    );
  }

  getCustomTextWidget({
    title = 'No Text Found',
    color = black,
    fontSize = 20.0,
    fonwWeight = FontWeight.normal,
  }) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fonwWeight,
      ),
    );
  }

  getCustomTiltedImage({
    required imagePath,
    radius = 20.0,
    mbottom = 1.0,
    angle = 0.3,
  }) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: EdgeInsets.only(bottom: mbottom),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: ExactAssetImage(
            imagePath,
          ),
        ),
      ),
    );
  }
}
