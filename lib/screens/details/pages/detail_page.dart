// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: list
              .map((e) => Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Expanded(child: Text(e.name)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
