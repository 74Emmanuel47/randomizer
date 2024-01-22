import 'package:flutter/material.dart';
import 'package:randomizer/templates/Molecules/Divisor.dart';
import 'package:randomizer/templates/Molecules/Floating_Button.dart';
import 'package:randomizer/templates/Molecules/Input_Gn.dart';
import 'package:randomizer/templates/Molecules/Input_Lg.dart';
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
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
              child: const InputGn(hint: "Título"),
            ),
            const Divisor(),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 16.0,
              ),
              child: const InputLg(
                hint: "Agrega una breve descripción...",
              ),
            ),
            const Divisor(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
