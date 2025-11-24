// core/network/connectivity_interceptor.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'connection_notifier.dart';

class ConnectivityInterceptor extends Interceptor {
  final Ref ref;

  ConnectivityInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final isNetworkError =
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.error is SocketException;

    if (isNetworkError) {
      final method = err.requestOptions.method.toUpperCase();

      if (method == "GET") {
        debugPrint(
          'ConnectivityInterceptor: GET request failed due to network error: ${err.type}',
        );

        ref.read(connectionErrorProvider.notifier).triggerError();
      }
    }

    handler.next(err);
  }

  // Опционально: Если запрос прошел успешно, можно авто-сбрасывать ошибку.
  // Но лучше делать это явно кнопкой "Повторить", чтобы не было мигания экранов.
}
