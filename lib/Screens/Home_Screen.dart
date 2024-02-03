// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Database/RandomizerDB.dart';
import 'package:randomizer/Screens/List_Screen.dart';
import 'package:randomizer/Screens/New_List_Screen.dart';
import 'package:randomizer/Templates/Molecules/Empty_List.dart';
import 'package:randomizer/Templates/Molecules/List_Item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Listas> lists;

  @override
  void initState() {
    setListas();
    super.initState();
  }

  void setListas() async {
    var aux = await RandomizerDB.readListas();
    setState(() {
      lists = aux;
    });
  }

  void deleteList(int id) async {
    await RandomizerDB.deleteLista(id);

    setListas();
  }

  void changeScreen(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListScreen(listId: id),
      ),
    );
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
      ),
      body: lists.isEmpty
          ? const EmptyList()
          : ListView.builder(
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal,
              ),
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return ListItem(
                  id: lists[index].id!,
                  title: lists[index].title,
                  subtitle: lists[index].description,
                  onPressed: () => changeScreen(lists[index].id!),
                  onPressedDelete: deleteList,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewList(),
            ),
          );

          setListas();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
