import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeNameType({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(pokemonModel.name ?? '', style: Constants.getPokemonTextStyle)),
              Text('#${pokemonModel.num}', style: Constants.getPokemonTextStyle),
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(label: Text(pokemonModel.type?.join(', ') ?? '', style: Constants.getPokemonTextStyle))
        ],
      ),
    );
  }
}
