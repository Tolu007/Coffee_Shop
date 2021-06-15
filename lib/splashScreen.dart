import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'loginPage.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new loginPage(),
      image: new Image.asset(
        'assets/splashLogo.png',
        height: 150,
        width: 150,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.brown[900],
      photoSize: 150.0,
      useLoader: false,
    );
  }
}
