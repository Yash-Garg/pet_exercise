part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required bool loading,
    required bool hasError,
    List<PostModel>? posts,
  }) = _PostState;

  factory PostState.initial() => const _PostState(
        loading: true,
        hasError: false,
      );
}
