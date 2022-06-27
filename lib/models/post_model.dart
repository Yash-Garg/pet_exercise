import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
