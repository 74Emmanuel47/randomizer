import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:randomizer/Themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _image = "images/DM_Randomizer_Logo.png";

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Theme.of(context).colorScheme.background,
      splashScreenBody: Center(
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
              "V.0.1.",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      nextScreen: const MyHomePage(title: ""),
    );
  }
}
