import 'package:dio/dio.dart';
import 'package:recipe_app/core/api/api.dart';
import 'package:recipe_app/core/api/base_api_impl.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/injector.dart';

class BaseAPI implements BaseApiImpl {
  Dio? _dio;
  final endPoint = locator<Api>();

  BaseAPI({Dio? dio}) {
    _dio = dio ?? Dio();
  }

  Options getDioHeaders({bool useToken = false}) {
    var header = <String, dynamic>{};
    header['Accept'] = 'application/json';
    header['Content-Type'] = 'application/json';
    if (useToken == true) {
      header['Authorization'] = 'Bearer <token>';
    }
    return Options(
        headers: header,
        sendTimeout: const Duration(seconds: 60), // 60 seconds
        receiveTimeout: const Duration(seconds: 60) // 60 seconds
        );
  }

  @override
  Future<Map<String, dynamic>> get(String url, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio!.get(
        url,
        queryParameters: query,
        options: getDioHeaders(),
      );
      // print(response.data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
