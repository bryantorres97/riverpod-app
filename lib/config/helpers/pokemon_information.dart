import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_app/domain/domain.dart';

final logger = Logger();

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      logger.i('${response.data}');

      final pokemonData = PokemonInfoResponse.fromJson(response.data);

      return pokemonData.name;
    } catch (e) {
      logger.e('Error: $e');
      return 'No se pudo obtener el nombre del pokemon';
    }
  }
}
