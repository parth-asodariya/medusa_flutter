import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseResource {
  final Dio client;

  BaseResource(this.client);
}
