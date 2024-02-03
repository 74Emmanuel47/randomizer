// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final int id;
  final String title;
  final String? subtitle;
  final Function()? onPressed;
  final Function(int id) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    subtitle ?? "",
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => onPressedDelete(id),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
