// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputGnT2 extends StatefulWidget {
  const InputGnT2({
    super.key,
    required this.title,
    required this.hint,
    required this.value,
  });

  final String title;
  final String hint;
  final TextEditingController value;

  @override
  State<InputGnT2> createState() => _InputGnT2();
}

class _InputGnT2 extends State<InputGnT2> {
  bool focusTFF = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 2.0,
      ),
      child: Focus(
        onFocusChange: (value) {
          setState(() {
            focusTFF = value;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              controller: widget.value,
              decoration: InputDecoration(
                hintText: widget.hint,
              ),
              style: GoogleFonts.electrolize(
                color: focusTFF ? const Color(0xff0E77B1) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
