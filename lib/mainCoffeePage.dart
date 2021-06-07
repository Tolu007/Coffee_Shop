import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_page.dart';

class mainCoffeePage extends StatefulWidget {
  @override
  _mainCoffeePageState createState() => _mainCoffeePageState();
}

class _mainCoffeePageState extends State<mainCoffeePage> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15.0),
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Welcome, Nadia',
                style: GoogleFonts.varela(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF473D3A)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 40.0,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: AssetImage('assets/model.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Container(
              child: Text(
                'Let\'s select the best taste for your next coffee break!',
                style: GoogleFonts.nunito(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFB0AAA7)),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Taste of the week',
                    style: GoogleFonts.varela(
                        fontSize: 17.0, color: Color(0xFF473D3A))),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text('See all',
                      style: GoogleFonts.varela(
                          fontSize: 17.0, color: Color(0xFFCEC7C4))),
                ),
              ]),
          SizedBox(height: 15.0),
          Container(
            height: 410.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _coffeeListCard(
                    'assets/starbucks.png',
                    'Caffe Mistro',
                    'Coffeeshop',
                    'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
                    '\$4.99',
                    fav),
                _coffeeListCard(
                    'assets/starbucks.png',
                    'Caffe Latte',
                    'BrownHouse',
                    'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
                    '\$3.99',
                    fav),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Explore nearby',
                  style: GoogleFonts.varela(
                      fontSize: 17.0, color: Color(0xFF473D3A))),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  'See All',
                  style: GoogleFonts.varela(
                      fontSize: 15.0, color: Color(0xFFCEC7C4)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 125.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImage('assets/coffee.jpg'),
                _buildImage('assets/coffee2.jpg'),
                _buildImage('assets/coffee3.jpg')
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  _buildImage(String imgPath) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        height: 100.0,
        width: 175.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
      ),
    );
  }

  _coffeeListCard(String imgPath, String coffeeName, String shopName,
      String description, String price, bool isFavourite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 300.0,
        width: 225.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 335.0,
                ),
                Positioned(
                  top: 75.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0),
                    height: 260.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFDAB68C)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Text(
                          shopName,
                          style: GoogleFonts.nunito(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          coffeeName,
                          style: GoogleFonts.nunito(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          description,
                          style: GoogleFonts.nunito(
                              fontSize: 14.0, color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              price,
                              style: GoogleFonts.varela(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (!fav) {
                                    fav = true;
                                  } else {
                                    fav = false;
                                  }
                                });
                              },
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color:
                                        isFavourite ? Colors.red : Colors.grey,
                                    size: 15.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 60.0,
                  top: 25.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => detailsPage()));
              },
              child: Container(
                height: 50.0,
                width: 225.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF473D3A)),
                child: Center(
                  child: Text(
                    'Order Now',
                    style: GoogleFonts.nunito(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
