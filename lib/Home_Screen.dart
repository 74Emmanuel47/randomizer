import 'package:flutter/material.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Database/RandomizerDB.dart';
import 'package:randomizer/New_List_Screen.dart';
import 'package:randomizer/templates/Molecules/Empty_List.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.themeMode});

  final ThemeMode themeMode;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late bool _isDark;

  late List<Listas> lists;

  @override
  void initState() {
    _isDark = widget.themeMode == ThemeMode.dark;
    super.initState();
  }

  getListas() async {
    lists = await RandomizerDB.readListas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getListas();
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
      body: lists.isEmpty
          ? const EmptyList()
          : ListView.builder(
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
