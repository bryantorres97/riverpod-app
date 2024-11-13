import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'Hello World';
}
