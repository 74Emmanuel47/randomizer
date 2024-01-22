import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key, required this.txt});

  final String txt;

  @override
  State<FloatingButton> createState() => _FloatingButton();
}

class _FloatingButton extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Guardar"),
      ),
    );
  }
}
