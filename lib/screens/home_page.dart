import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.list});

  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].name),
              );
            }));
  }
}
