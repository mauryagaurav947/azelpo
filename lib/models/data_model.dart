import 'dart:io';

import 'package:http/http.dart';

/// Global class to store data
/// and paginated products fetched from RestApi
/// and the type of data will be the parameter type of class
///
class Data<T> {
  final int statusCode;
  final String message;
  final T? data;

  const Data({
    this.message = 'Data not found',
    this.data,
    this.statusCode = 204,
  });

  /// Data model from Response
  factory Data.fromResponse(Response response) {
    return Data(
      statusCode: response.statusCode,
      message: response.reasonPhrase ?? 'Data retrieved',
    );
  }

  /// Data model handles the exceptions
  factory Data.fromException(Object exception) {
    if (exception is SocketException) {
      return Data(
        statusCode: exception.osError!.errorCode,
        message: exception.osError!.message,
      );
    }
    return Data(
      statusCode: 000,
      message: exception.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': statusCode,
      'message': message,
      'data': data,
    };
  }

  // Copy with existing data
  Data<T> copyWith<T>({
    int? statusCode,
    String? message,
    T? data,
  }) =>
      Data<T>(
        data: data ?? (this.data as T),
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );
}