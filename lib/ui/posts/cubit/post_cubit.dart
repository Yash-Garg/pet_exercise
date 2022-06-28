import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petperfect_exercise/data/api/data_api.dart';
import 'package:petperfect_exercise/data/injection/injectable.dart';
import 'package:petperfect_exercise/data/models/models.dart';

part '../../../generated/ui/posts/cubit/post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState.initial());

  void started() {
    _getPosts();
  }

  Future<void> _getPosts() async {
    final postResponse = await getIt<DataApi>().getPosts();

    postResponse.fold(
      (posts) => emit(state.copyWith(posts: posts, loading: false)),
      (err) => emit(
        state.copyWith(hasError: true, loading: false, error: err),
      ),
    );
  }
}
