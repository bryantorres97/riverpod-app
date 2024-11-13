import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increaseByOne() {
    state++;
  }
}

@Riverpod(keepAlive: true)
class RandomName extends _$RandomName {
  @override
  String build() => "Bryan Torres";

  void setName(String name) {
    state = name;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toogleDarkMode() {
    state = !state;
  }
}
