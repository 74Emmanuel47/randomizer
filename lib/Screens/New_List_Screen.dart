import 'package:flutter/material.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:randomizer/Templates/Molecules/Divisor.dart';
import 'package:randomizer/Templates/Molecules/List_Item.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn.dart';
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
  void addItem() async {}

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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    id: index,
                    title: items[index].title,
                    subtitle: items[index].description.toString(),
                    onPressed: null,
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
