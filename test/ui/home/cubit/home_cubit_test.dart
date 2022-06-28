import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petperfect_exercise/ui/home/cubit/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    test('initial state is loading', () {
      expect(HomeCubit().state.loading, equals(true));
    });
  });
}
