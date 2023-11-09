// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

// load env data
final BMS_HOST = dotenv.get('BMS_HOST', fallback: '');
final BMS_API_PORT = dotenv.get('BMS_API_PORT', fallback: '0');
final BMS_BLOB_PORT = dotenv.get('BMS_BLOB_PORT', fallback: '0');

// create static handler
final BMS_Api = ApiHandler(baseURL: 'http://$BMS_HOST:$BMS_API_PORT/api');
final BMS_Blob = ApiHandler(baseURL: 'http://$BMS_HOST:$BMS_BLOB_PORT');
