import 'package:dio/dio.dart';
import 'package:riverpod_app/domain/domain.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      final pokemonData = pokemonInfoResponseFromJson(response.data);

      return pokemonData.name;
    } catch (e) {
      return 'No se pudo obtener el nombre del pokemon';
    }
  }
}
