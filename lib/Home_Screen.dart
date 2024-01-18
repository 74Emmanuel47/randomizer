import 'package:flutter/material.dart';
import 'package:randomizer/Themes/theme_Manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.themeMode});

  final ThemeMode themeMode;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late bool _isDark;

  @override
  void initState() {
    _isDark = widget.themeMode == ThemeMode.dark;
    super.initState();
  }

  Future setTheme(bool isDark) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Randomizer",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: _isDark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
