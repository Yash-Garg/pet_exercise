import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petperfect_exercise/api/data_api.dart';
import 'package:petperfect_exercise/di/injectable.dart';
import 'package:petperfect_exercise/models/models.dart';

part '../../../generated/ui/home/cubit/home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void started() {
    _getImage();
  }

  Future<void> _getImage() async {
    final imageResponse = await getIt<DataApi>().getRandomMedia();

    imageResponse.fold(
      (image) => emit(state.copyWith(imageUrl: image.url, loading: false)),
      (error) => emit(
        state.copyWith(hasError: true, loading: false, error: error),
      ),
    );
  }

  void processed() => emit(state.copyWith(isProcessed: true));
}
