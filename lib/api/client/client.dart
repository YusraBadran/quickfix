import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:quickfix/api/request_model.dart';
import 'package:quickfix/core/storage/storage.dart';
import '../header_types_enum.dart';
import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
    ),
  );

  /// -------- Request Header
  static Map<String, String> setRequestHeader({
    HeaderTypes headerType = HeaderTypes.authorizationContent,
  }) {
    final Map<String, String> header = {
      'X-Requested-With': 'XMLHttpRequest',
      if (headerType == HeaderTypes.contentType ||
          headerType == HeaderTypes.authorizationContent)
        'Content-Type': 'application/json',
      if (headerType == HeaderTypes.authorizationContent)
        'Authorization':
            'Bearer ${Storage().readFromUserBox(LocalStorageKeys.token.name)}',
    };
    return header;
  }
  // ${Storage().readFromUserBox(LocalStorageKeys.token.name)}

  /// -------- This Function to call with api
  static Future<Either> callApi({
    required String apiUrl,
    RequestTypes requestType = RequestTypes.post,
    dynamic requestHeader,
    dynamic requestBody,
  }) async {
    requestHeader ??= setRequestHeader();
    Response response;
    RequestModel requestModel = RequestModel(
      url: apiUrl,
      headers: requestHeader,
      body: requestBody ?? {},
      requestType: requestType,
    );

    dio.options.headers = requestModel.headers;
    try {
      response = await makeCall(requestModel);
      return Right(response);
    } on DioException catch (error) {
      return Left(error);
    } on SocketException {
      return const Left("");
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future makeCall(RequestModel requestModel) async {
    switch (requestModel.requestType) {
      case RequestTypes.get:
        return await dio.get(
          requestModel.url,
        );
      case RequestTypes.put:
        return await dio.put(
          requestModel.url,
          data: requestModel.body,
        );
      default:
        return await dio.post(
          requestModel.url,
          data: requestModel.body,
        );
    }
  }

  /// --------- Exception From Dio Error
  static exceptionFromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return {
          "code": "0",
          "error_message": "Request was cancelled!",
        };

      case DioExceptionType.connectionTimeout:
        return {"code": "400", "error_message": "Connection timeout!"};

      case DioExceptionType.receiveTimeout:
        return {
          "code": "500",
          "error_message": "Receive timeout!",
        };

      case DioExceptionType.sendTimeout:
        return {
          "code": "500",
          "error_message": "Send timeout!",
        };

      case DioExceptionType.connectionError:
        return {
          "code": "500",
          "error_message": "Connection error!",
        };
      case DioExceptionType.badResponse:
        return handelErrorMessage(dioException.response!.data);
      default:
        return {
          "code": "500",
          "error_message": "Unknown error!",
        };
    }
  }

  /// --------- Handel Error Message
  static handelErrorMessage(message) {
    return {
      // "data": message["data"],
      "title": message["title"],
      "detail": message["detail"],
      "status": message["status"],
    };
  }
}
