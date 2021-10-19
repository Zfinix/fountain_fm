import 'package:dartz/dartz.dart';
import 'package:fountain_fm/core/exception/exception.dart';
import 'package:fountain_fm/core/fountain_api/fountain_api.dart';

class Repository {
  Repository({
    ApiClient? apiClient,
  }) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  /// Login User
  Future<Either<FountainFailure, PodcastModel>> getPodcasts() async {
    try {
      final res = await _apiClient.getPodcasts();

      return Right(res);
    } catch (e) {
      if (e is ApiRequestFailure) {
        return Left(FountainFailure(message: e.message));
      }
      return Left(FountainFailure(message: 'Unable to get Podcasts'));
    }
  }
}
