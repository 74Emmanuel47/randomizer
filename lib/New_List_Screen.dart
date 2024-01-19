import 'package:flutter/material.dart';
import 'package:randomizer/templates/Molecules/Input_Gn.dart';
import 'package:randomizer/templates/Molecules/Input_Gn_T2.dart';
import 'package:randomizer/templates/Molecules/List_Item.dart';

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
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: const InputGn(hint: ""),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0.0,
              ),
              child: Divider(
                color: Theme.of(context).colorScheme.onSecondary,
                height: 2.0,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              margin: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 16.0,
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListItem(
                    title: "$index.- Elemento $index",
                    subtitle: "Sci-Fi",
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Guardar"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
