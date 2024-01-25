import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 2.0,
      ),
      child: Focus(
        onFocusChange: (value) {},
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
            ),
          ],
        ),
      ),
    );
  }
}
