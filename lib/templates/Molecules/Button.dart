// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonDashed extends StatelessWidget {
  const ButtonDashed({
    super.key,
    required this.onTap,
    required this.hint,
    required this.enabled,
  });

  final Function()? onTap;
  final String hint;
  final bool enabled;

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
          onPressed: enabled ? onTap : null,
          child: Text(hint),
        ),
      ),
    );
  }
}
