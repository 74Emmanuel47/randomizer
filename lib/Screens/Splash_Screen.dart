// ignore_for_file: file_names

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.theme});

  final ThemeMode theme;

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final String _image = ThemeMode.system == ThemeMode.dark
      ? "images/DM_Randomizer_Logo.png"
      : "images/Randomizer_Logo.png";

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      splashScreenBody: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Text(
                  "RANDOMIZER",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 160, top: 160),
                child: Image(
                  image: AssetImage(_image),
                ),
              ),
              Text(
                "V.1.5",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
      nextScreen: const HomeScreen(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
