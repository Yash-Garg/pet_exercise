part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    required bool hasError,
    required bool isProcessed,
    ApiError? error,
    String? mediaUrl,
  }) = _HomeState;

  factory HomeState.initial() => const _HomeState(
        loading: true,
        hasError: false,
        isProcessed: false,
      );

  factory HomeState.loaded() => const _HomeState(
        loading: false,
        hasError: false,
        isProcessed: false,
      );

  factory HomeState.error() => const _HomeState(
        loading: false,
        hasError: true,
        isProcessed: false,
      );

  factory HomeState.processed() => const _HomeState(
        loading: false,
        hasError: false,
        isProcessed: true,
      );
}
