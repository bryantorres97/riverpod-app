import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
part 'future_providers.g.dart';

final logger = Logger(printer: PrettyPrinter());

@Riverpod(keepAlive: true)
Future<String> pokemonName(Ref ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  logger.d('Vamos a buscar el nombre del pokemon $pokemonId');
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  ref.onDispose(() {
    logger.i('Vamos a eliminar el provider');
  });

  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  void nextPokemon() {
    state = state + 1;
  }

  void previousPokemon() {
    if (state < 2) return;
    state = state - 1;
  }
}

@Riverpod(keepAlive: true)
Future<String> pokemon(Ref ref, int pokemonId) async {
  final pokemonName =
      await PokemonInformation.getPokemonNameWithHttp(pokemonId);
  return pokemonName;
}
