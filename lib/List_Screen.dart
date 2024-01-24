import 'package:flutter/material.dart';
import 'package:randomizer/templates/Molecules/Buttons/Button_Dashed.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.title});

  final String title;

  @override
  State<ListScreen> createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const DashedButton(txt: "Agregar Elemento"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 0,
            itemBuilder: (context, index) {
              return const ListItem(title: "Titulo 1", subtitle: "Subtitulo 2");
            },
          ),
        ],
      ),
    );
  }
}
