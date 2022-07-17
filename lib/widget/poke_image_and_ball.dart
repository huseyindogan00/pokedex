import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeImageAndBall({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(pokemonModel.img);
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            width: UiHelper.calculatePokeImageAndBallSize(),
            height: UiHelper.calculatePokeImageAndBallSize(),
            Constants.pokebollImagePath,
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemonModel.id!,
            child: CachedNetworkImage(
              width: UiHelper.calculatePokeImageAndBallSize(),
              height: UiHelper.calculatePokeImageAndBallSize(),
              imageUrl: pokemonModel.img ?? '',
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: UiHelper.getColorFromType(pokemonModel.type!.first)),
              fit: BoxFit.fitHeight,
              errorWidget: (context, url, error) {
                debugPrint(error);
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ],
    );
  }
}
