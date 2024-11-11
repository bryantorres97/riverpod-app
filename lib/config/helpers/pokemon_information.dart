import 'package:dio/dio.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'No se encontró el nombre del pokemon';
    } catch (e) {
      return 'No se pudo obtener el nombre del pokemon';
    }
  }
}
