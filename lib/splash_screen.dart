import 'package:flutter/material.dart';
import 'package:maths_puzzles/Pages/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 5000,
      imageSize: 600,
      imageSrc: "assets/images/SplashScreen.gif",
      text: "By Caribbean ",
      textType: TextType.TyperAnimatedText,

      textStyle: const TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        // fontFamily: "GAJR"
        fontFamily: "ODR",
        letterSpacing: 3,

      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
