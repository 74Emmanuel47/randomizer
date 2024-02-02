// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputGn extends StatefulWidget {
  InputGn({
    super.key,
    required this.hint,
    required this.controller,
  });

  final TextEditingController controller;
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
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            icon: Icon(
              Icons.title,
              size: 25,
              color: focusTFF ? const Color(0xff0E77B1) : Colors.black,
            ),
          ),
          style: GoogleFonts.electrolize(
            color: focusTFF ? const Color(0xff0E77B1) : Colors.black,
          ),
        ),
      ),
    );
  }
}
