import 'eden_failure.dart';

/// ApiRequestFailure
class ApiRequestFailure implements Exception {
  const ApiRequestFailure([this.message = 'An Error Occured']);
  final String message;

  factory ApiRequestFailure.fromFountainFailure(FountainFailure err) =>
      ApiRequestFailure(err.message);

  @override
  String toString() => 'ApiRequestFailure(message: $message)';
  FountainFailure toFountainFailure() =>
      FountainFailure.fromApiRequestFailure(this);
}
