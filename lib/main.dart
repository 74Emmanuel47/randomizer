// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:randomizer/Themes/Themes.dart';
import 'package:randomizer/Themes/theme_Manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();
late SharedPreferences _prefs;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
    getTheme();
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  Future getTheme() async {
    _prefs = await SharedPreferences.getInstance();

    bool? isDark = _prefs.getBool("isDark");

    if (isDark != null) {
      _themeManager.toggleTheme(isDark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en"),
        const Locale("es"),
      ],
      title: 'Randomizer',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(theme: _themeManager.themeMode),
      debugShowCheckedModeBanner: false,
    );
  }
}
