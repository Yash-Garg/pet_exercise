import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/image_model.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required int fileSizeBytes,
    required String url,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
