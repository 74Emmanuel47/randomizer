import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key, required this.txt});

  final String txt;

  @override
  State<FloatingButton> createState() => _FloatingButton();
}

class _FloatingButton extends State<FloatingButton> {
  bool isEnabled = true;

  save() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isEnabled ? save() : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
          if (isEnabled) {
            return Theme.of(context).colorScheme.primary;
          } else {
            return Theme.of(context).colorScheme.secondary;
          }
        })),
        child: Text(
          "Guardar",
          style: isEnabled ? const TextStyle(color: Colors.white) : null,
        ),
      ),
    );
  }
}
