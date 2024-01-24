import 'package:flutter/material.dart';

class InputGn extends StatefulWidget {
  const InputGn({super.key, required this.hint});

  final String hint;

  @override
  State<InputGn> createState() => _InputGn();
}

class _InputGn extends State<InputGn> {
  bool focusTFF = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
      child: Focus(
        onFocusChange: (value) {
          setState(() {
            focusTFF = value;
          });
        },
        child: TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
            icon: Icon(
              Icons.title,
              size: 25,
              color: focusTFF ? const Color(0xff0E77B1) : Colors.black,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
