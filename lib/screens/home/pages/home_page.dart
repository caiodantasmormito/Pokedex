// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/widget/pokemon_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Text('Pokedex'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: list
              .map(
                (e) => PokemonItem(
                  pokemon: e,
                  onTap: onItemTap,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
