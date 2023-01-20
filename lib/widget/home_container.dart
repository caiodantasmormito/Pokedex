import 'package:flutter/material.dart';
import 'package:pokedex/error/failure.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/screens/home_error.dart';
import 'package:pokedex/screens/home_loading.dart';
import 'package:pokedex/screens/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return MyHomePage(
            list: snapshot.data!,
          );
        }
        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
