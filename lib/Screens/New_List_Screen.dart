import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Templates/Molecules/Divisor.dart';
import 'package:randomizer/Templates/Molecules/List_Item.dart';
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

  @override
  void initState() {
    items = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              setState(() {
                opcionController.clear();
                desOpcionController.clear();
              });
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
        items.add(
          Listas(
            title: opcionController.text,
            description: desOpcionController.text,
          ),
        );
        opcionController.clear();
        desOpcionController.clear();
      });
    }
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
            ElevatedButton(
              onPressed: addItem,
              child: const Text("Agregar"),
            ),
            const Divisor(),
            Expanded(
              child: ListView.builder(
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
          ],
        ),
      ),
    );
  }
}
