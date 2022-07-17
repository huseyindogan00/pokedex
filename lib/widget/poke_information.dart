import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemonModel;

  const PokeInformation({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: UiHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemonModel.name),
            _buildInformationRow('Height', pokemonModel.height),
            _buildInformationRow('Weight', pokemonModel.weight),
            _buildInformationRow('Spawn Time', pokemonModel.spawnTime),
            _buildInformationRow('Weakness', pokemonModel.weaknesses),
            _buildInformationRow('Pre Evolution', pokemonModel.prevEvolution),
            _buildInformationRow('Next Evolution', pokemonModel.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(),
        ),
        value is List && value.isNotEmpty
            ? Text(
                value.join(', '),
                style: Constants.getPokeInfoTextStyle(),
              )
            : value == null
                ? const Text('Not available')
                : Text(
                    value,
                    style: Constants.getPokeInfoTextStyle(),
                  )
      ],
    );
  }
}
