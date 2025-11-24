import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/constants/app_endpoints.dart';
import 'package:mobile_study/core/network/connectivity_interceptor.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message';
}

class ApiService {
  final Ref ref;
  final Dio dio;
  late final Dio _tokenDio;

  ApiService({required this.dio, required this.ref}) {
    _tokenDio = Dio(dio.options);
    _addInterceptor(dio);
  }

  final String optionAuthKey = "withAuth";

  void _addInterceptor(Dio dio) {
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final withAuth = options.extra[optionAuthKey] as bool? ?? true;
          if (withAuth) {
            final authNotifier = ref.read(authNotifierProvider.notifier);
            final token = await authNotifier.getAccessToken;
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          debugPrint(
            'Auth Interceptor: Error ${error.response?.statusCode} on ${error.requestOptions.path}',
          );
          if (error.response?.statusCode == 401) {
            final authNotifier = ref.read(authNotifierProvider.notifier);

            if (error.requestOptions.path.contains(AppEndpoints.authRefresh)) {
              debugPrint('Auth Interceptor: 401 on refresh token, logging out');
              await authNotifier.logout();
              return handler.next(error);
            }

            if (error.requestOptions.path.contains(AppEndpoints.authLogin) ||
                error.requestOptions.path.contains(AppEndpoints.authRegister)) {
              debugPrint(
                'Auth Interceptor: 401 on login/register, passing error',
              );
              return handler.next(error);
            }

            debugPrint(
              'Auth Interceptor: 401 on regular request, trying to refresh',
            );
            await authNotifier.refreshToken();
            try {
              final newToken = await authNotifier.getAccessToken;
              if (newToken != null) {
                debugPrint(
                  'Auth Interceptor: Token refreshed, retrying request',
                );
                error.requestOptions.headers['Authorization'] =
                    'Bearer $newToken';
                final retryResponse = await dio.fetch(error.requestOptions);
                return handler.resolve(retryResponse);
              } else {
                debugPrint(
                  'Auth Interceptor: Token refresh failed (null), logging out',
                );
                await authNotifier.logout();

                return handler.next(error);
              }
            } catch (e) {
              debugPrint("Auth Interceptor: Error during token refresh: $e");
              await authNotifier.logout();
              return handler.next(error);
            }
          }

          if (error.response?.statusCode == 400) {
            debugPrint('Bad Request: ${error.response?.data}');
            //Здесь получается нужно открытьстраницу с перезагрзкой
            //(Вопрос будет как реализовать нажатие кнопки на 404 странице и перезапуск последнего запроса)
          }
          handler.next(error);
        },
        onResponse: (response, handler) async {
          handler.next(response);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getList(
    String endpoint, {
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.cast<Map<String, dynamic>>();
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data, {
    bool withAuth = true,
    bool isTokenRequest = false,
  }) async {
    try {
      final client = isTokenRequest ? _tokenDio : dio;
      final response = await client.post(
        endpoint,
        data: data,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data as Map<String, dynamic>;
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<Map<String, dynamic>> postMultipart(
    String endpoint,
    Map<String, dynamic> fields,
    Map<String, File?> files, {
    bool withAuth = true,
  }) async {
    try {
      final formData = FormData();

      fields.forEach((key, value) {
        if (value != null) {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });
      for (final entry in files.entries) {
        final key = entry.key;
        final file = entry.value;
        if (file != null) {
          formData.files.add(
            MapEntry(
              key,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }
      final response = await dio.post(
        endpoint,
        data: formData,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data as Map<String, dynamic>;
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<Map<String, dynamic>> putMultipart(
    String endpoint, {
    required Map<String, dynamic> fields,
    required Map<String, File?> files,
    bool withAuth = true,
  }) async {
    try {
      final formData = FormData();

      fields.forEach((key, value) {
        if (value != null) {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });
      for (final entry in files.entries) {
        final key = entry.key;
        final file = entry.value;
        if (file != null) {
          formData.files.add(
            MapEntry(
              key,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }
      final response = await dio.put(
        endpoint,
        data: formData,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data as Map<String, dynamic>;
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data, {
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: Options(extra: {optionAuthKey: withAuth}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.data);
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(
          e.response?.data.toString() ?? e.message ?? "Unknown error",
          e.response?.statusCode,
        );
      }
      throw ApiException("Something went wrong: $e");
    }
  }

  Future<Map<String, dynamic>> postMultipartList(
    String endpoint, {
    required Map<String, dynamic> fields,
    required List<File> files,
    required String fileFieldKey,
    bool withAuth = true,
  }) async {
    try {
      final formData = FormData();
      fields.forEach(((key, value) {
        if (value != null) {
          if (value != null) {
            formData.fields.add(MapEntry(key, value.toString()));
          }
        }
      }));

      for (final file in files) {
        final filename = file.path.split('/').last;

        // Dio позволяет добавлять много файлов с ОДНИМ ключом
        // Бэкенд увидит это как массив
        formData.files.add(
          MapEntry(
            fileFieldKey, // 'photos'
            await MultipartFile.fromFile(file.path, filename: filename),
          ),
        );
      }

      final response = await dio.post(
        endpoint,
        data: formData,
        options: Options(extra: {optionAuthKey: withAuth}),
        // Полезно для отладки загрузки
        onSendProgress: (count, total) {
          print(
            "Upload progress: ${(count / total * 100).toStringAsFixed(0)}%",
          );
        },
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data as Map<String, dynamic>;
      } else {
        throw ApiException(response.data, response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      if (e is DioException) {
        // ... твоя обработка ошибок ...
        throw ApiException(e.message ?? "Dio error");
      }
      throw ApiException("Something went wrong: $e");
    }
  }
}

class ApiServiceDi {
  static final String baseUrl = dotenv.env['API_URL'] ?? "";
  static final String apiVersion = dotenv.env['API_VERSION'] ?? "";
  static final String fullBaseUrl = '$baseUrl/$apiVersion';

  static const Duration _defaultTimeout = Duration(seconds: 10);
  static const Duration _connectionTimeout = Duration(seconds: 5);

  static final apiServiceProvider = Provider<ApiService>((ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: fullBaseUrl,
        connectTimeout: _connectionTimeout,
        receiveTimeout: _defaultTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );
    dio.interceptors.add(ConnectivityInterceptor(ref));

    return ApiService(dio: dio, ref: ref);
  });
}
