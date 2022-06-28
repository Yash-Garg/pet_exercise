part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    required bool hasError,
    required bool isProcessed,
    ApiError? error,
    String? imageUrl,
  }) = _HomeState;

  factory HomeState.initial() => const _HomeState(
        loading: true,
        hasError: false,
        isProcessed: false,
      );
}
