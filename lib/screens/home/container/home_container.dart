// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/error/failure.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/screens/details/container/detail_container.dart';

import '../pages/home_error.dart';
import '../pages/home_loading.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

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
            list: snapshot.data!, onItemTap: onItemTap,
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
