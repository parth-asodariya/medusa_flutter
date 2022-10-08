import 'package:dio/dio.dart';

class BaseResource {
  final Dio _client;

  BaseResource(this._client);
}
