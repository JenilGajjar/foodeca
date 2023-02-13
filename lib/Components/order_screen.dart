// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'curve_painter.dart';

class OrderScreen extends StatelessWidget {
  String foodName;
  String imageUrl;
  double price;
  Color imageColor;
  OrderScreen({
    Key? key,
    required this.foodName,
    required this.imageUrl,
    required this.price,
    required this.imageColor,
  }) : super(key: key);
  static const black = Color.fromARGB(255, 29, 30, 34);
  static const white = Color.fromARGB(255, 250, 250, 253);
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black,
      appBar: appbarContent(context),
      body: bodyContent,
      endDrawer: Drawer(),
    );
  }

  appbarContent(context) {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_sharp),
      ),
      title: getCustomTextWidget(
          color: Colors.white, title: 'My order', fontSize: 19.0),
      centerTitle: true,
      leadingWidth: 60,
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.more_vert),
            );
          },
        )
      ],
    );
  }

  get bodyContent {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 254, 255, 254),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(bottom: 25, left: 19, right: 19),
            height: 320,
            width: 350,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: const [
                            TextSpan(
                              text: 'Carbonara\n',
                              style: TextStyle(
                                color: black,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '240g . \$16',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 158, 159, 158)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 246, 247, 247),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('1/4',
                            style: TextStyle(
                                color: Color.fromARGB(255, 142, 143, 145),
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: -120,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // padding: EdgeInsets.all(1),
                      width: width,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 243, 242, 243),
                            width: 29),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 254, 255, 254),
                        radius: 154,
                        child: CircleAvatar(
                          radius: 98,
                          backgroundImage: AssetImage(imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),

                /*
                Positioned.fill(
                  top: 100,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        alignment: Alignment.topCenter,
                        width: 200,
                        height: 60,
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: getCustomTextWidget(title: 'ADD SPICES'),
                            ),
                            Icon(
                              Icons.double_arrow_rounded,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomTextWidget(title: 'Details', fontSize: 22.0),
              getCustomTextWidget(
                  title: 'See more',
                  color: Color.fromARGB(255, 127, 126, 131),
                  fontSize: 12.0)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: imageColor),
                        margin: EdgeInsets.all(4),
                        height: 120,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: getCustomTextWidget(
                                    title: 'Average rate', fontSize: 9.0)),
                            Padding(
                                padding: EdgeInsets.only(left: 10, top: 1),
                                child: getCustomTextWidget(
                                    title: '4.65',
                                    fonwWeight: FontWeight.w700,
                                    fontSize: 26.0)),
                            Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: imageColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: CustomPaint(
                                    painter: CurvePainter(),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  child: SizedBox(
                                    width: 100,
                                    child: DottedLine(
                                      dashLength: 4.0,
                                      dashColor: Colors.white,
                                      dashGapLength: 2.0,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 254, 255, 254)),
                        margin: EdgeInsets.all(4),
                        height: 120,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13.0, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.alarm,
                                  color: Color.fromARGB(255, 199, 199, 198),
                                  size: 15,
                                ),
                              ),
                              SizedBox(height: 25),
                              getCustomTextWidget(
                                  title: 'Delivery time',
                                  color: Color.fromARGB(255, 188, 188, 189),
                                  fontSize: 9.9,
                                  fonwWeight: FontWeight.w500),
                              SizedBox(height: 3),
                              getCustomTextWidget(
                                title: '12:45',
                                color: black,
                                fontSize: 24.8,
                                fonwWeight: FontWeight.w600,
                              ),
                              // SizedBox(height: 5)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 49, 52, 56)),
                    margin: EdgeInsets.all(10),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // textBaseline: TextBaseline.ideographic,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 19, bottom: 12),
                          child: getCustomTextWidget(
                              title: 'Delivery address',
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 133, 135, 138)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 19),
                          child: getCustomTextWidget(
                            title: '6391 Elgin St. Celina,\nDelaware 10299',
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              Container(
                height: 240,
                width: 140,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 241, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.only(left: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 185, 209, 255)),
                      padding: EdgeInsets.all(9),
                      child: Icon(
                        Icons.wallet,
                        color: white,
                        size: 20,
                      ),
                    ),
                    Column(
                      children: [
                        getCustomTextWidget(
                            title:
                                '\$${(price.toInt() == price) ? price.toInt() : price}',
                            fontSize: 32.0,
                            color: black),
                        getCustomTextWidget(
                          title: 'Total',
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 157, 160, 171),
                        )
                      ],
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 254, 255, 254),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 7, right: 18),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: black,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.keyboard_double_arrow_right,
                                    color: Color.fromARGB(255, 111, 113, 118),
                                  )),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.only(left: 10),
                            child: getCustomTextWidget(
                                title: 'Pay now',
                                color: Color.fromARGB(255, 172, 172, 173),
                                fontSize: 13.0,
                                fonwWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getCustomTextWidget({
    title = 'No Text Found',
    color = white,
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
}
