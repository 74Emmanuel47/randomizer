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
    int index = lists.indexWhere((element) => element.id == id);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Alerta",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
            fontFamily: Theme.of(context).textTheme.headlineLarge!.fontFamily,
          ),
        ),
        content: Text("Está a punto de borrar la lista ${lists[index].title}. "
            "¿Está seguro de eliminar la lista permanentemente?"),
        actions: [
          //Cancelar
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          //Cancelar
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await RandomizerDB.deleteLista(id);
              setListas();
            },
            child: Text(
              "Borrar",
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeScreen(int id) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListScreen(listId: id),
      ),
    );
    setListas();
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
