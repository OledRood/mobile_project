import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mobile_study/core/services/api_service.dart';

import 'mocked_data/mock_auth_notifier.dart';

class MockRef extends Ref {
  @override
  // TODO: implement container
  ProviderContainer get container => throw UnimplementedError();

  @override
  bool exists(ProviderBase<Object?> provider) {
    // TODO: implement exists
    throw UnimplementedError();
  }

  @override
  void invalidate(ProviderOrFamily provider) {
    // TODO: implement invalidate
  }

  @override
  void invalidateSelf() {
    // TODO: implement invalidateSelf
  }

  @override
  KeepAliveLink keepAlive() {
    // TODO: implement keepAlive
    throw UnimplementedError();
  }

  @override
  ProviderSubscription<T> listen<T>(
    ProviderListenable<T> provider,
    void Function(T? previous, T next) listener, {
    void Function(Object error, StackTrace stackTrace)? onError,
    bool? fireImmediately,
  }) {
    // TODO: implement listen
    throw UnimplementedError();
  }

  @override
  void listenSelf(
    void Function(Object? previous, Object? next) listener, {
    void Function(Object error, StackTrace stackTrace)? onError,
  }) {
    // TODO: implement listenSelf
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void onAddListener(void Function() cb) {
    // TODO: implement onAddListener
  }

  @override
  void onCancel(void Function() cb) {
    // TODO: implement onCancel
  }

  @override
  void onDispose(void Function() cb) {
    // TODO: implement onDispose
  }

  @override
  void onRemoveListener(void Function() cb) {
    // TODO: implement onRemoveListener
  }

  @override
  void onResume(void Function() cb) {
    // TODO: implement onResume
  }

  @override
  T read<T>(ProviderListenable<T> provider) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  T refresh<T>(Refreshable<T> provider) {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  T watch<T>(ProviderListenable<T> provider) {
    // TODO: implement watch
    throw UnimplementedError();
  }
}

void main() {
  late Dio dio;
  late ApiService apiService;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    apiService = ApiService(dio: dio, ref: MockRef());
    dioAdapter = DioAdapter(dio: dio);

    apiService = ApiService(dio: dio, ref: MockRef());
  });
  test('getList returns list of maps', () async {
    // Пример: мокаем ответ GET /list
    dioAdapter.onGet(
      '/list',
      (server) => server.reply(
        200,
        [
          {"id": 1, "name": "Obj1"},
          {"id": 2, "name": "Obj2"},
        ],
        // headers: {'content-type': 'application/json'},
      ),
    );
    final result = await apiService.getList('/list');
    expect(result, isA<List<Map<String, dynamic>>>());
    expect(result.first['name'], equals('Obj1'));
  });
}
