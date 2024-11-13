import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat(Ref ref) async* {
  final names = <String>[];

  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }
}
