// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/screens/home/container/home_container.dart';

import '../screens/details/container/detail_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (
                  route,
                  arguments,
                ) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                arguments: (settings.arguments as DetailArguments),
                repository: repository,
              );
            },
          );
        }
      },
    );
  }
}
