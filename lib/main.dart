import 'package:flutter/material.dart';
import 'package:randomizer/Splash_Screen.dart';
import 'package:randomizer/Themes/Themes.dart';
import 'package:randomizer/Themes/theme_Manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
    getTheme();
    super.initState();
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
      title: 'Randomizer',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: SplashScreen(theme: _themeManager.themeMode),
    );
  }
}
