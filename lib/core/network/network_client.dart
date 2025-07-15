import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import 'exceptions.dart';

class NetworkClient {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';
  static const Duration _connectionTimeout = Duration(seconds: 30);
  static const Duration _receiveTimeout = Duration(seconds: 30);

  late final Dio _dio;
  CacheOptions? _cacheOptions;

  NetworkClient({CacheOptions? cacheOptions}) {
    _cacheOptions = cacheOptions;
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: _connectionTimeout,
        receiveTimeout: _receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  static Future<CacheOptions> createCacheOptions() async {
    final dir = await getTemporaryDirectory();
    final cacheStore = HiveCacheStore(
      dir.path,
      hiveBoxName: 'pokemon_http_cache',
    );

    return CacheOptions(
      store: cacheStore,
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
  }

  void _setupInterceptors() {
    // Add cache interceptor first if available
    if (_cacheOptions != null) {
      _dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions!));
    }

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => debugPrint(obj.toString()),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          _handleError(error);
          handler.next(error);
        },
      ),
    );
  }

  Future<T> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    bool showErrorToast = true,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      final exception = _mapDioException(e);
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    } catch (e) {
      const exception = NetworkException(message: 'Unexpected error');
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    }
  }

  Future<T> post<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool showErrorToast = true,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      final exception = _mapDioException(e);
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    } catch (e) {
      const exception = NetworkException(message: 'Unexpected error');
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    }
  }

  Future<T> put<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool showErrorToast = true,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      final exception = _mapDioException(e);
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    } catch (e) {
      const exception = NetworkException(message: 'Unexpected error');
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    }
  }

  Future<T> delete<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool showErrorToast = true,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      final exception = _mapDioException(e);
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    } catch (e) {
      const exception = NetworkException(message: 'Unexpected error');
      if (showErrorToast) {
        _showErrorToast(exception.message);
      }
      throw exception;
    }
  }

  NetworkException _mapDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        if (dioException.error is SocketException) {
          return const NoInternetException();
        }
        return NetworkException(
          message: 'Connection error: ${dioException.message}',
        );

      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final errorMessage = dioException.response?.data?['message'] as String?;

        switch (statusCode) {
          case 400:
            return BadRequestException(details: errorMessage);
          case 401:
            return const UnauthorizedException();
          case 404:
            return NotFoundException(details: errorMessage);
          case 500:
          case 502:
          case 503:
            return ServerException(details: errorMessage);
          default:
            return NetworkException(
              message: errorMessage ?? 'HTTP error',
              statusCode: statusCode,
            );
        }

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request was cancelled');

      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'SSL certificate error');

      case DioExceptionType.unknown:
        return NetworkException(
          message: dioException.message ?? 'Unknown network error',
        );
    }
  }

  void _handleError(DioException error) {
    debugPrint('Network Error: ${error.message}');
    debugPrint('Request: ${error.requestOptions.uri}');
    debugPrint('Response: ${error.response?.data}');
  }

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
