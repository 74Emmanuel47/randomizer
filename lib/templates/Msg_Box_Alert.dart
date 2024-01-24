import 'package:flutter/material.dart';

class MsgBoxNewAlert extends StatefulWidget {
  const MsgBoxNewAlert({super.key});

  @override
  State<MsgBoxNewAlert> createState() => _MsgBoxNewAlert();
}

class _MsgBoxNewAlert extends State<MsgBoxNewAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      scrollable: true,
      title: Text(
        "Precaución",
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.error,
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.zero,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "El elemento seleccionado será eliminado, ¿Está seguro de que quiere eliminarlo permanentemente?",
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
