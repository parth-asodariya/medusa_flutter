import 'package:medusa_flutter/medusa_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/core/utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  var url = "BASE_URL_OF_SERVER";
  var medusa;

  @override
  void onInit() {
    super.onInit();
    medusa = Medusa(Config(baseUrl: "http://192.168.1.5:9000"));
    httpClient.timeout = Duration(seconds: 60);

    httpClient.addRequestModifier<dynamic>((request) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var cookie = prefs.getString('Cookie').toString();
      Map<String, String> headers = {
        "Cookie": cookie,
        "content-type": "application/json"
      };
      request.headers.addAll(headers);
      return request;
    });
  }

  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  Future fetchId(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      String? id = ''}) async {
    try {
      dynamic data = await medusa.products.retrieve(id);
      print(data);
      onSuccess!(data);
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      onError!(error);
    }
  }

  Future fetchProducts(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {}}) async {
    try {
      dynamic data = await medusa.products.list();
      print(data);
      onSuccess!(data);
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      onError!(error);
    }
  }
}
