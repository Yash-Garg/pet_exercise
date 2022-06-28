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

  Future<Either<ImageModel, ApiError>> getRandomMedia() async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>(Constants.imageDataUrl);

      final image = ImageModel.fromJson(response.data!);
      return left(image);
    } catch (e) {
      return right(const ApiError(message: 'Failed to fetch random image.'));
    }
  }

  Future<Either<List<PostModel>, ApiError>> getPosts() async {
    try {
      final response = await dio.get(Constants.postDataUrl);

      final posts =
          List<PostModel>.from(response.data.map((d) => PostModel.fromJson(d)));

      return left(posts);
    } catch (e, trace) {
      debugPrint('$e\n$trace');
      return right(const ApiError(message: 'Failed to load posts.'));
    }
  }
}
