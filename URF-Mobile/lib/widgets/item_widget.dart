// ignore_for_file: unnecessary_null_comparison

import 'package:firstapp/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          onTap: () {
            // ignore: avoid_print
            print("Item pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}
