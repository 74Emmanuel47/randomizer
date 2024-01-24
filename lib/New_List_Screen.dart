import 'package:flutter/material.dart';
import 'package:randomizer/templates/Molecules/Buttons/Button_Dashed.dart';
import 'package:randomizer/templates/Molecules/Divisor.dart';
import 'package:randomizer/templates/Molecules/Buttons/Floating_Button.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Lg.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

class NewList extends StatefulWidget {
  const NewList({super.key});

  @override
  State<NewList> createState() => _NewList();
}

class _NewList extends State<NewList> {
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
            const InputGn(hint: "Título"),
            const Divisor(),
            const InputLg(
              hint: "Agrega una breve descripción...",
            ),
            const Divisor(),
            const DashedButton(txt: "Agregar Elemento"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListItem(title: "Título $index", subtitle: "Sci-Fi");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: const FloatingButton(txt: "Hecho"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
