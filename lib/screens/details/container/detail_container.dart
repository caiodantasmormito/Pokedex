// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/widget/error.dart';
import 'package:pokedex/widget/loading.dart';

import '../../../error/failure.dart';
import '../../../models/pokemon.dart';
import '../../../repository/pokemon_repository.dart';
import '../pages/detail_page.dart';

class DetailArguments {
  final Pokemon pokemon;

  DetailArguments({required this.pokemon});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
  }) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
          );
        }
        if (snapshot.hasError) {
          return Error(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
