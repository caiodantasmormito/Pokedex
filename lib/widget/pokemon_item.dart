// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:pokedex/screens/details/container/detail_container.dart';

import '../models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon)),
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor!.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    pokemon.num,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Flexible(child: Center(child: Image.network(pokemon.image)))
          ],
        ),
      ),
    );
  }
}
