// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodeca/Components/order_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  static const black = Color.fromARGB(255, 28, 30, 35);
  final violet = const Color.fromARGB(255, 98, 69, 255);
  final grey = const Color.fromARGB(255, 188, 188, 188);
  double width = 0;

  var foodList = [
    {
      "imageUrl": "assets/Images/sushi1.jpg",
      "foodName": "Sushi",
      "price": 18.0,
      "height": 230.0,
      "imageColor": Color.fromARGB(255, 254, 180, 146)
    },
    {
      "imageUrl": "assets/Images/hotdog.jpg",
      "foodName": "Hotdog",
      "price": 16.2,
      "height": 200.0,
      "imageColor": Color.fromARGB(255, 250, 172, 76)
    },
    {
      "imageUrl": "assets/Images/donut.jpg",
      "foodName": "Donut",
      "price": 25.0,
      "height": 260.0,
      "imageColor": Color.fromARGB(255, 220, 154, 254)
    },
    {
      "imageUrl": "assets/Images/pizza-slice2.jpg",
      "foodName": "Pizza",
      "price": 28.0,
      "height": 230.0,
      "imageColor": Color.fromARGB(255, 254, 214, 133)
    },
    {
      "imageUrl": "assets/Images/french-fries.jpg",
      "foodName": "French Fries",
      "price": 16.0,
      "height": 200.0,
      "imageColor": Color.fromARGB(255, 255, 217, 126)
    },
    {
      "imageUrl": "assets/Images/cup-cake2.jpg",
      "foodName": "Cup cake",
      "price": 22.0,
      "height": 230.0,
      "imageColor": Color.fromARGB(255, 54, 218, 255)
    },
    {
      "imageUrl": "assets/Images/burger3.jpg",
      "foodName": "Burger",
      "price": 25.0,
      "height": 220.0,
      "imageColor": Color.fromARGB(255, 254, 236, 94)
    },
    {
      "imageUrl": "assets/Images/Fastfood-21_generated.jpg",
      "foodName": "Noodles",
      "price": 29.0,
      "height": 250.0,
      "imageColor": Color.fromARGB(255, 254, 224, 130)
    },
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent,
      endDrawer: const Drawer(),
      drawer: const Drawer(),
      body: bodyContent,
      bottomNavigationBar: bottomNavigationBarContent,
      resizeToAvoidBottomInset: false,
    );
  }

  get appBarContent {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: const Color.fromARGB(255, 158, 158, 158),
          );
        },
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2.1),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: black, borderRadius: BorderRadius.circular(18)),
          child: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  return Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.person_outlined, size: 28)),
          ),
        )
      ],
    );
  }

  get bodyContent {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 20),
            child: RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: 'What would\nyou',
                  style: TextStyle(
                      color: Color.fromARGB(255, 20, 18, 20),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' like to order?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 167, 166, 167),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 242, 243, 242),
                hintText: 'Search food',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 167, 166, 167)),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                suffixIcon: const Icon(
                  Icons.search_sharp,
                  color: Color.fromARGB(255, 67, 67, 66),
                )),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 400,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  child: getData(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  get bottomNavigationBarContent {
    return Container(
      padding: const EdgeInsets.only(right: 22, bottom: 24, left: 22),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined,
                    color: Color.fromARGB(255, 175, 176, 180)),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_outlined,
                    color: Color.fromARGB(255, 175, 176, 180)),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,
                    color: Color.fromARGB(255, 175, 176, 180)),
                label: ''),
          ],
          selectedItemColor: const Color.fromARGB(255, 162, 163, 163),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  getCustomTextWidget(
      {title = 'No Text Found',
      color = black,
      fontSize = 20.0,
      fontWeight = FontWeight.normal,
      textAlign = TextAlign.center}) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  getCustomFoodCard(
      {imageUrl = 'assets/Images/sushi1.jpg',
      foodName = 'Sushi',
      price = 18,
      height = 200.0,
      imageColor = Colors.blue}) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return OrderScreen(
                  foodName: foodName,
                  imageUrl: imageUrl,
                  price: price,
                  imageColor: imageColor,
                );
              },
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 13, right: 7),
            child: Stack(
              children: [
                SizedBox(
                  height: height,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 135,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(foodName,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 173, 173, 173))),
                          Text(
                            '\$$price',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < foodList.length; i++)
                if (i % 2 == 0)
                  getCustomFoodCard(
                    foodName: foodList[i]['foodName'],
                    height: foodList[i]['height'],
                    price: foodList[i]['price'],
                    imageUrl: foodList[i]['imageUrl'],
                    imageColor: foodList[i]['imageColor'],
                  )
            ],
          ),
        ),
        Expanded(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < foodList.length; i++)
                if (i % 2 != 0)
                  getCustomFoodCard(
                    foodName: foodList[i]['foodName'],
                    height: foodList[i]['height'],
                    price: foodList[i]['price'],
                    imageUrl: foodList[i]['imageUrl'],
                    imageColor: foodList[i]['imageColor'],
                  )
            ],
          ),
        ),
      ],
    );
  }
}
