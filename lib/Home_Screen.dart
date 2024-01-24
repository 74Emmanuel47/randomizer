import 'package:flutter/material.dart';
import 'package:randomizer/New_List_Screen.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

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

  @override
  void dispose() {
    super.dispose();
  }

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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListItem(
            title: "$index.- Elemento $index",
            subtitle: "$index",
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewList(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
