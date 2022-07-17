import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widget/poke_information.dart';
import 'package:pokedex/widget/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemonModel;
  const DetailPage({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          ScreenUtil().orientation == Orientation.portrait ? _buildPotraitBody(context) : _buildLandScapeBody(context),
    );
  }

  _buildLandScapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemonModel.type!.first),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UiHelper.getIconPadding(),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 18.w,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemonModel: pokemonModel),
                      Expanded(
                        child: Hero(
                          tag: pokemonModel.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemonModel.img!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: UiHelper.getDefaultPadding(),
                    child: PokeInformation(pokemonModel: pokemonModel),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Scaffold _buildPotraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemonModel.type!.first),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UiHelper.getIconPadding(),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 18.w,
            ),
          ),
          PokeNameType(pokemonModel: pokemonModel),
          SizedBox(height: 20.h),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    Constants.pokebollImagePath,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: PokeInformation(pokemonModel: pokemonModel),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemonModel.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemonModel.img!,
                      height: 0.24.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
