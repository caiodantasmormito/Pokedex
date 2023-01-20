import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/repository/pokemon_repository.dart';

import 'package:pokedex/widget/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
