// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomizer/Database/Models/Items.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Database/RandomizerDB.dart';
import 'package:randomizer/Templates/Molecules/Divisor.dart';
import 'package:randomizer/Templates/Molecules/List_Item.dart';
import 'package:randomizer/templates/Molecules/Button.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn_T2.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Lg.dart';

class NewList extends StatefulWidget {
  const NewList({super.key});

  @override
  State<NewList> createState() => _NewList();
}

class _NewList extends State<NewList> {
  late List<Listas> items;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final opcionController = TextEditingController();
  final desOpcionController = TextEditingController();
  bool enabledButton = false;

  @override
  void initState() {
    items = [];
    titleController.addListener(onTitleChange);
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.clear();
    opcionController.clear();
    desOpcionController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void onTitleChange() {
    if (mounted) {
      setState(() {
        enabledButton = !enabledButton;
      });
    }
  }

  //Add new item
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
            onPressed: () {
              Navigator.pop(context);

              if (opcionController.text.isNotEmpty) {
                setState(() {
                  items.add(
                    Listas(
                      title: opcionController.text,
                      description: desOpcionController.text,
                    ),
                  );
                });
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

  void updateItems(int id) async {
    setState(() {
      opcionController.text = items[id].title;
      desOpcionController.text = items[id].description!;
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
      setState(() {
        Listas auxItem = Listas(
            title: opcionController.text,
            description: desOpcionController.text);
        items[id] = auxItem;
      });
    }

    setState(() {
      opcionController.clear();
      desOpcionController.clear();
    });
  }

  void deleteItem(int id) {
    setState(() {
      items.removeAt(id);
    });
  }

  void saveList() async {
    try {
      int id = await RandomizerDB.insertLista(
        Listas(
          title: titleController.text,
          description: descriptionController.text,
        ),
      );

      if (items.isNotEmpty) {
        for (var item in items) {
          int itemID = await RandomizerDB.insertItem(
            Items(
              id: id,
              listID: id,
              title: item.title,
              description: item.description,
            ),
          );
          print(itemID);
        }
      }
    } catch (e) {
      print(e);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nueva Lista",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Form(
        child: Column(
          children: [
            InputGn(
              hint: "Título",
              controller: titleController,
            ),
            const Divisor(),
            InputLg(
              hint: "Agrega una breve descripción...",
              controller: descriptionController,
            ),
            const Divisor(),
            ButtonDashed(
              onTap: addItem,
              hint: "Agregar Elemento",
              enabled: true,
              background: Theme.of(context).colorScheme.primary,
              colorText: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16.0),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    id: index,
                    title: items[index].title,
                    subtitle: items[index].description.toString(),
                    onPressed: () => updateItems(index),
                    onPressedDelete: deleteItem,
                  );
                },
              ),
            ),
            ButtonDashed(
              enabled: titleController.text.isNotEmpty ? true : false,
              onTap: saveList,
              hint: "Hecho",
              background: Theme.of(context).colorScheme.primary,
              colorText: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
