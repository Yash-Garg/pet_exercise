import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petperfect_exercise/data/injection/injectable.dart';
import 'package:petperfect_exercise/ui/home/cubit/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    test('initial state is loading', () {
      expect(HomeCubit().state.loading, equals(true));
    });

    blocTest<HomeCubit, HomeState>(
      'emits isProcessed [bool] when media is completely loaded',
      build: HomeCubit.new,
      act: (cubit) => cubit.processed(),
      expect: () => [HomeState.processed()],
    );

    blocTest<HomeCubit, HomeState>(
      'emits loaded state when the media is fetched',
      setUp: () => configureDependencies(),
      wait: Duration(seconds: 5),
      build: HomeCubit.new,
      act: (cubit) => cubit.started(),
      expect: () => [HomeState.loaded()],
    );
  });
}
