part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required bool loading,
    required bool hasError,
    ApiError? error,
    List<PostModel>? posts,
  }) = _PostState;

  factory PostState.initial() => const _PostState(
        loading: true,
        hasError: false,
      );

  factory PostState.loaded({required List<PostModel> posts}) => _PostState(
        loading: false,
        hasError: false,
        posts: posts,
      );

  factory PostState.error({required ApiError apiError}) => _PostState(
        loading: false,
        hasError: true,
        error: apiError,
      );
}
