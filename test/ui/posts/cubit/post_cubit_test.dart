import 'package:flutter_test/flutter_test.dart';
import 'package:petperfect_exercise/ui/posts/cubit/post_cubit.dart';

void main() {
  group('PostCubit', () {
    test('initial state is loading', () {
      expect(PostCubit().state.loading, equals(true));
    });
  });
}
