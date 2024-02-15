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
import 'package:randomizer/templates/Molecules/List_Item_T2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.newOption,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          children: [
            InputGnT2(
              title: AppLocalizations.of(context)!.option,
              hint: "",
              value: opcionController,
            ),
            InputGnT2(
              title: AppLocalizations.of(context)!.description,
              hint: "",
              value: desOpcionController,
            ),
            Text(
              AppLocalizations.of(context)!.note,
              style: GoogleFonts.electrolize(
                fontSize: 10,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
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
              AppLocalizations.of(context)!.accept,
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
        title: Text(
          AppLocalizations.of(context)!.editOption,
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          children: [
            InputGnT2(
              title: AppLocalizations.of(context)!.option,
              hint: "",
              value: opcionController,
            ),
            InputGnT2(
              title: AppLocalizations.of(context)!.description,
              hint: "",
              value: desOpcionController,
            ),
            Text(
              AppLocalizations.of(context)!.note,
              style: GoogleFonts.electrolize(
                fontSize: 10,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
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
              AppLocalizations.of(context)!.accept,
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

  void deleteItem(int id) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.alert,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
            fontFamily: Theme.of(context).textTheme.headlineLarge!.fontFamily,
          ),
        ),
        content: Text(
          AppLocalizations.of(context)!
              .deleteOptionMessageNoList(items[id].title),
        ),
        actions: [
          //Cancelar
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          //Cancelar
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              setState(() {
                items.removeAt(id);
              });
            },
            child: Text(
              AppLocalizations.of(context)!.delete,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
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
          await RandomizerDB.insertItem(
            Items(
              id: id,
              listID: id,
              title: item.title,
              description: item.description,
            ),
          );
        }
      }
    } catch (e) {}

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.newListScreen,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Form(
        child: Column(
          children: [
            InputGn(
              hint: AppLocalizations.of(context)!.title,
              controller: titleController,
            ),
            const Divisor(),
            InputLg(
              hint: AppLocalizations.of(context)!.hintDescription,
              controller: descriptionController,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.note,
                style: GoogleFonts.electrolize(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const Divisor(),
            ButtonDashed(
              onTap: addItem,
              hint: AppLocalizations.of(context)!.hintAddButton,
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
                  if (items[index].description!.isEmpty) {
                    return ListItemT2(
                      id: index,
                      title: items[index].title,
                      onPressed: () => updateItems(index),
                      onPressedDelete: deleteItem,
                    );
                  }
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
              hint: AppLocalizations.of(context)!.hintSaveButton,
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
