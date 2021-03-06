import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';

class detailsPage extends StatefulWidget {
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 20.0,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF3B2B7),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2 - 20.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 + 25.0,
                left: 15.0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 2) - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Text(
                        'Preparation Time',
                        style: GoogleFonts.nunito(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF726B68)),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        '5 min',
                        style: GoogleFonts.nunito(
                            fontSize: 14.0, color: Color(0xFFc6C4C4)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      //this is the line
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Ingredients',
                        style: GoogleFonts.nunito(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF726B68)),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 110.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIngredientItem(
                                'Water',
                                Icon(
                                  Feather.droplet,
                                  size: 10.0,
                                ),
                                Color(0xFF6FC5DA)),
                            buildIngredientItem(
                                'Brewed Espresso',
                                Icon(
                                  Feather.target,
                                  size: 18.0,
                                ),
                                Color(0xFF615955)),
                            buildIngredientItem(
                                'Sugar',
                                Icon(
                                  Feather.box,
                                  size: 18.0,
                                ),
                                Color(0xFFF39595)),
                            buildIngredientItem(
                                'Toffee Nut Syrup',
                                Icon(
                                  MaterialCommunityIcons.peanut_outline,
                                  size: 18.0,
                                ),
                                Color(0xFF8FC28A)),
                            buildIngredientItem(
                                'Natural Flavours',
                                Icon(
                                  MaterialCommunityIcons.leaf_maple,
                                  size: 18.0,
                                ),
                                Color(0xFF3B8079)),
                            buildIngredientItem(
                                'Vanilla Syrup',
                                Icon(
                                  MaterialCommunityIcons.flower_tulip,
                                  size: 18.0,
                                ),
                                Color(0xFFF8B870)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Nutrition Information',
                        style: GoogleFonts.nunito(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF726B68)),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Calories',
                            style: GoogleFonts.nunito(
                                fontSize: 14.0, color: Color(0xFFD4D3D2)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            '250',
                            style: GoogleFonts.nunito(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Proteins',
                            style: GoogleFonts.nunito(
                                fontSize: 14.0, color: Color(0xFFD4D3D2)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            '10g',
                            style: GoogleFonts.nunito(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Caffeine',
                            style: GoogleFonts.nunito(
                                fontSize: 14.0, color: Color(0xFFD4D3D2)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            '150mg',
                            style: GoogleFonts.nunito(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF716966)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      //line
                      Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Color(0xFF473D3A),
                            ),
                            child: Center(
                              child: Text(
                                'Make Order',
                                style: GoogleFonts.nunito(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 10,
                left: 75.0,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pinkcup.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  top: 25.0,
                  left: 15.0,
                  child: Container(
                    height: 300.0,
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //use a row with crossaxis as end
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 150.0,
                              child: Text(
                                'Caramel Macchiato',
                                style: GoogleFonts.varela(
                                    fontSize: 29.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white),
                              child: Center(
                                  child: Icon(Icons.favorite,
                                      size: 18.0, color: Colors.red)),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 170.0,
                          child: Text(
                            'Freshly steamed milk with vanilla syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
                            style: GoogleFonts.nunito(
                                fontSize: 13.0, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color(0xFF473D3A)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '4.2',
                                      style: GoogleFonts.nunito(
                                          fontSize: 13.0, color: Colors.white),
                                    ),
                                    Text(
                                      '/5',
                                      style: GoogleFonts.nunito(
                                          fontSize: 13.0,
                                          color: Color(0xFF7C7573)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 80.0,
                                    ),
                                    Positioned(
                                      left: 40.0,
                                      child: Container(
                                        height: 35.0,
                                        width: 35.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(17.5),
                                            border: Border.all(
                                                color: Color(0xFFF3B2B7),
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/man.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20.0,
                                      child: Container(
                                        height: 35.0,
                                        width: 35.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(17.5),
                                            border: Border.all(
                                                color: Color(0xFFF3B2B7),
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/model.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.5),
                                          border: Border.all(
                                              color: Color(0xFFF3B2B7),
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/model2.jpg'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  '+27 more',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12.0, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  buildIngredientItem(String name, Icon iconName, Color bgColor) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: bgColor),
              child: Center(child: iconName)),
          SizedBox(height: 4.0),
          Container(
              width: 60.0,
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontSize: 12.0, color: Color(0xFFC2C0C0)),
                ),
              ))
        ],
      ),
    );
  }
}
