import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon id $pokemonId'),
        ),
        body: Center(
            child: pokemonAsync.when(
                data: (data) {
                  return Text(data);
                },
                error: (error, stackTrace) {
                  return Text('$error');
                },
                loading: () => const CircularProgressIndicator())),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'nextPokemon',
              child: const Icon(Icons.add),
              onPressed: () {
                pokemonId++;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: 'previousPokemon',
              child: const Icon(Icons.remove),
              onPressed: () {
                if (pokemonId < 2) return;
                pokemonId--;
                setState(() {});
              },
            ),
          ],
        ));
  }
}
