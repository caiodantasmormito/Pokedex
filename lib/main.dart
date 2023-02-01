import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/routes/route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoute(
          repository: PokemonRepository(
            dio: Dio(),
          ),
        ));
  }
}
