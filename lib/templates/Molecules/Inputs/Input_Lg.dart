// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputLg extends StatefulWidget {
  const InputLg({super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  State<InputLg> createState() => _InputLg();
}

class _InputLg extends State<InputLg> {
  bool focusTFF = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 16.0,
      ),
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
          ),
          maxLines: 2,
          style: GoogleFonts.electrolize(
            color: focusTFF ? const Color(0xff0E77B1) : Colors.black,
          ),
        ),
      ),
    );
  }
}
