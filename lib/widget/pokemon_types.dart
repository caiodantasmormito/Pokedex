// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PokemonTypes extends StatelessWidget {
  const PokemonTypes({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(child: Text(name)),
    );
  }
}
