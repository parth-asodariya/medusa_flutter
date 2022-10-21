import '/core/app_export.dart';
import 'package:shopsie/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 5000), () {
      Get.offNamed(AppRoutes.mainLandingScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
