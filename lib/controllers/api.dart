import 'package:dio/dio.dart';

class ApiHandler {
  final String baseURL;
  Dio? _api;

  ApiHandler({required this.baseURL}) {
    _api = Dio(BaseOptions(baseUrl: baseURL));
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    return await _api!.get(path, queryParameters: params);
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? params, Object? data}) async {
    return await _api!.post(path, queryParameters: params, data: data);
  }

  Future<Response> put(String path,
      {Map<String, dynamic>? params, Object? data}) async {
    return await _api!.put(path, queryParameters: params, data: data);
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? params, Object? data}) async {
    return await _api!.delete(path, queryParameters: params, data: data);
  }
}

// ignore: non_constant_identifier_names
final BMS_Api = ApiHandler(baseURL: 'http://103.157.218.126:30000/api');
