// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonDashed extends StatelessWidget {
  const ButtonDashed({
    super.key,
    required this.onTap,
    required this.hint,
    required this.enabled,
    required this.background,
    required this.colorText,
  });

  final Function()? onTap;
  final String hint;
  final bool enabled;
  final Color background;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: background,
          ),
          onPressed: enabled ? onTap : null,
          child: Text(
            hint,
            style: TextStyle(
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
