import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomizer/Database/Models/Items.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Database/RandomizerDB.dart';
import 'package:randomizer/templates/Molecules/Empty_List.dart';
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
    await RandomizerDB.deleteItem(id);
    getInfoItems();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list.title),
      ),
      body: items.isEmpty
          ? EmptyList()
          : ListView.builder(
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
    );
  }
}
