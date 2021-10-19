import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fountain_fm/core/exception/api_request_failure.dart';

class FountainFailure with EquatableMixin {
  bool status;
  final String message;

  FountainFailure({
    this.status = false,
    required this.message,
  });

  FountainFailure copyWith({
    bool? status,
    String? message,
  }) {
    return FountainFailure(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
    };
  }

  factory FountainFailure.fromMap(Map<String, dynamic> map) {
    return FountainFailure(
      status: map['status'] ?? false,
      message: map['message'],
    );
  }

  factory FountainFailure.fromApiRequestFailure(ApiRequestFailure err) {
    return FountainFailure(message: err.message);
  }

  String toJson() => json.encode(toMap());

  factory FountainFailure.fromJson(String source) =>
      FountainFailure.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, message];
}
