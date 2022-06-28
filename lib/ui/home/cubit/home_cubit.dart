import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petperfect_exercise/data/api/data_api.dart';
import 'package:petperfect_exercise/data/injection/injectable.dart';
import 'package:petperfect_exercise/data/models/models.dart';

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
      (media) => emit(HomeState.loaded().copyWith(mediaUrl: media.url)),
      (error) => emit(HomeState.error().copyWith(error: error)),
    );
  }

  void processed() => emit(
        HomeState.processed().copyWith(mediaUrl: state.mediaUrl),
      );
}
