import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewList extends StatefulWidget {
  const NewList({super.key});

  @override
  State<NewList> createState() => _NewList();
}

class _NewList extends State<NewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nueva Lista",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter),
          ),
        ],
      ),
    );
  }
}
