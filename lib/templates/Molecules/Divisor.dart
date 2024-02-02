// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Divisor extends StatelessWidget {
  const Divisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24.0,
      ),
      child: Divider(
        color: Theme.of(context).colorScheme.onSecondary,
        height: 2.0,
      ),
    );
  }
}
