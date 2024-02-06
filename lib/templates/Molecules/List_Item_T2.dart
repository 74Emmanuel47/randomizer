// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListItemT2 extends StatelessWidget {
  const ListItemT2({
    super.key,
    required this.id,
    required this.title,
    required this.onPressed,
    required this.onPressedDelete,
  });

  final int id;
  final String title;
  final Function()? onPressed;
  final Function(int id) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 4.0,
                ),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.headlineMedium!.fontFamily,
                    fontSize: 22,
                    color: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => onPressedDelete(id),
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
