// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomizer/Database/Models/Items.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Database/RandomizerDB.dart';
import 'package:randomizer/templates/Molecules/Button.dart';
import 'package:randomizer/templates/Molecules/Divisor.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn_T2.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.listId});

  final int listId;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final opcionController = TextEditingController();
  final desOpcionController = TextEditingController();
  late Listas list;
  late List<Items> items;

  @override
  void initState() {
    getInfoList();
    getInfoItems();
    super.initState();
  }

  void getInfoList() async {
    Listas aux = await RandomizerDB.readOneList(widget.listId);
    setState(() {
      list = aux;
    });
  }

  void getInfoItems() async {
    List<Items> auxItems = await RandomizerDB.readItems(widget.listId);

    setState(() {
      items = auxItems;
    });
  }

  void onPressedDelete(int id) async {
    int index = items.indexWhere((element) => element.id == id);

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
        content: Text(
            "Está a punto de borrar la opción ${items[index].title} de la lista ${list.title}. "
            "¿Está seguro de eliminar la opción permanentemente?"),
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
              await RandomizerDB.deleteItem(id);
              getInfoItems();
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

  void addItem() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Nueva Opción",
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          children: [
            InputGnT2(
              title: "Opción",
              hint: "",
              value: opcionController,
            ),
            InputGnT2(
              title: "Descripción",
              hint: "",
              value: desOpcionController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancelar",
              style: GoogleFonts.electrolize(
                color: Colors.red,
              ),
            ),
          ),

          //Accept
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              if (opcionController.text.isNotEmpty) {
                await RandomizerDB.insertItem(
                  Items(
                      listID: widget.listId,
                      title: opcionController.text,
                      description: desOpcionController.text),
                );
                getInfoItems();
              }
            },
            child: Text(
              "Aceptar",
              style: GoogleFonts.electrolize(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );

    setState(() {
      opcionController.clear();
      desOpcionController.clear();
    });
  }

  void updateItems(int id, int index) async {
    setState(() {
      opcionController.text = items[index].title;
      desOpcionController.text = items[index].description!;
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Editar Opción",
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          children: [
            InputGnT2(
              title: "Opción",
              hint: "",
              value: opcionController,
            ),
            InputGnT2(
              title: "Descripción",
              hint: "",
              value: desOpcionController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancelar",
              style: GoogleFonts.electrolize(
                color: Colors.red,
              ),
            ),
          ),

          //Accept
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Aceptar",
              style: GoogleFonts.electrolize(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );

    if (opcionController.text.isNotEmpty) {
      Items auxItem = Items(
        id: items[index].id,
        listID: items[index].listID,
        title: opcionController.text,
        description: desOpcionController.text,
      );
      await RandomizerDB.updateItem(auxItem);
      getInfoItems();
    }

    setState(() {
      opcionController.clear();
      desOpcionController.clear();
    });
  }

  void updateList() async {
    setState(() {
      opcionController.text = list.title;
      desOpcionController.text = list.description!;
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Editar Opción",
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          children: [
            InputGnT2(
              title: "Opción",
              hint: "",
              value: opcionController,
            ),
            InputGnT2(
              title: "Descripción",
              hint: "",
              value: desOpcionController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancelar",
              style: GoogleFonts.electrolize(
                color: Colors.red,
              ),
            ),
          ),

          //Accept
          TextButton(
            onPressed: () async {
              if (opcionController.text.isNotEmpty) {
                Listas auxList = Listas(
                  id: list.id,
                  title: opcionController.text,
                  description: desOpcionController.text,
                );
                await RandomizerDB.updateLista(auxList);
                getInfoList();
              }
              Navigator.pop(context);
            },
            child: Text(
              "Aceptar",
              style: GoogleFonts.electrolize(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
    setState(() {
      opcionController.clear();
      desOpcionController.clear();
    });
  }

  int chooseOption() {
    double repeat = Random().nextDouble();

    if (repeat < Random().nextDouble()) {
      Timer(const Duration(seconds: 5), () {});
      return chooseOption();
    } else {
      return Random().nextInt(items.length);
    }
  }

  void showDecision() {
    int option = chooseOption();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Decisión",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        content: Wrap(
          children: [
            Text(
                "El sistema de Randomizer ha determinado que usted debería elegir la opción ${items[option].title}. ¿Está de acuerdo con la decisión de Randomizer?"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDecision();
            },
            child: const Text("Repetir"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Aceptar"),
          ),
        ],
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
        title: Text(list.title),
        actions: [
          IconButton(
            onPressed: updateList,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              list.description!.isEmpty
                  ? "Que la suerte este siempre de tu lado..."
                  : list.description!,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                fontFamily:
                    Theme.of(context).textTheme.headlineLarge!.fontFamily,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const Divisor(),
          ButtonDashed(
            onTap: addItem,
            hint: "Agregar Elemento",
            enabled: true,
            background: Theme.of(context).colorScheme.primary,
            colorText: Colors.white,
          ),
          const Divisor(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListItem(
                  id: items[index].id!,
                  title: items[index].title,
                  subtitle: items[index].description,
                  onPressed: () => updateItems(items[index].listID, index),
                  onPressedDelete: onPressedDelete,
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonDashed(
            onTap: showDecision,
            hint: "Random!",
            enabled: items.isNotEmpty,
            background: Theme.of(context).colorScheme.primary,
            colorText: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
