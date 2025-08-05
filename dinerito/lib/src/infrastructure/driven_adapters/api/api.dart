import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../helpers/enum/http_request_type.dart';
import '../../models/error_api_model.dart';

class Api {
  Api({
    this.withAuth = true,
  });

  final bool withAuth;
  final dio = Dio(); // Puedes configurar headers por defecto si quieres

  Future<Either<ErrorApiModel, Map<String, dynamic>>> call(
    String path, {
    required HttpRequestType method,
    required String codeApiError,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _sendRequest(
        path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode as int == 200) {
        return Right<ErrorApiModel, Map<String, dynamic>>(response.data);
      } else {
        return Left<ErrorApiModel, Map<String, dynamic>>(
          ErrorApiModel.fromMap(response.data),
        );
      }
    } catch (e) {
      return Left<ErrorApiModel, Map<String, dynamic>>(ErrorApiModel(
        url: path,
        message: e.toString(),
        detail: e.toString(),
        code: codeApiError,
      ));
    }
  }

  dynamic _sendRequest(
    String path, {
    required HttpRequestType method,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    switch (method) {
      case HttpRequestType.post:
      case HttpRequestType.get:
      case HttpRequestType.update:
        return dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options ??
              Options(
                validateStatus: (status) {
                  return status != null && status < 500;
                },
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
        );
      default:
        return dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
