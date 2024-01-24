import 'package:flutter/material.dart';

class InputLg extends StatefulWidget {
  const InputLg({super.key, required this.hint});

  final String hint;

  @override
  State<InputLg> createState() => _InputLg();
}

class _InputLg extends State<InputLg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 16.0,
      ),
      child: Focus(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
