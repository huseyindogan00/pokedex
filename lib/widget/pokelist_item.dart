// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widget/poke_image_and_ball.dart';
import 'package:pokedex/widget/pokemon_list_widget.dart';

class PokeListItem extends StatelessWidget {
  PokemonModel pokemon;
  PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(pokemonModel: pokemon)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UiHelper.getColorFromType(pokemon.type!.first),
        child: Padding(
          padding: UiHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name ?? 'N/A', style: Constants.getPokemonTextStyle),
              Chip(label: Text(pokemon.type!.first, style: Constants.getTypeChipTextStyle)),
              Expanded(child: PokeImageAndBall(pokemonModel: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
