import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petperfect_exercise/constants.dart';
import 'package:petperfect_exercise/models/models.dart';

@lazySingleton
class DataApi {
  DataApi(this.dio);

  final Dio dio;

  Future<Either<ImageModel, ApiError>> getRandomImage() async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>(Constants.imageDataUrl);

      final image = ImageModel.fromJson(response.data!);

      debugPrint('Fetched image url - ${image.url}');
      return left(image);
    } catch (e, trace) {
      debugPrint('ERROR - $e\nTRACE - $trace');
      return right(const ApiError(message: 'Failed to fetch random image.'));
    }
  }
}
