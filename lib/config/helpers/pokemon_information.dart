import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:riverpod_app/domain/domain.dart';

final logger = Logger();

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 1));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      final pokemonData = PokemonInfoResponse.fromJson(response.data);

      return pokemonData.name;
    } catch (e) {
      logger.e('Error: $e');
      return 'No se pudo obtener el nombre del pokemon';
    }
  }

  static Future<String> getPokemonNameWithHttp(int pokemonId) async {
    await Future.delayed(const Duration(seconds: 1));

    final url = Uri.https('pokeapi.co', '/api/v2/pokemon/$pokemonId');
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      logger.e('Error: ${response.statusCode}');
      logger.e('response: ${response.body}');
      return 'No se pudo obtener el nombre del pokemon';
    }

    final jsonResponse = convert.jsonDecode(response.body);
    final pokemonData = PokemonInfoResponse.fromJson(jsonResponse);
    return pokemonData.name;
  }
}
