import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseResource {
  final Dio client;

  BaseResource(this.client){
    setCookie();
  }

  setCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    client.options.headers['Cookie'] = prefs.getString('Cookie');
  }
}
