import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randomizer/templates/Molecules/Inputs/Input_Gn_T2.dart';

class MsgBoxNewItem extends StatefulWidget {
  const MsgBoxNewItem({super.key});

  @override
  State<MsgBoxNewItem> createState() => _MsgBoxNewItem();
}

class _MsgBoxNewItem extends State<MsgBoxNewItem> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      scrollable: true,
      title: Text(
        "Nueva Opción",
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.zero,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InputGnT2(title: "Opción", hint: ""),
              const InputGnT2(title: "Etiqueta", hint: ""),
              Text(
                "Nota: no es necesario agregar una descripción.",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontFamily: "Electrolize",
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Aceptar",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: "Electrolize",
            ),
          ),
        ),
      ],
    );
  }
}
