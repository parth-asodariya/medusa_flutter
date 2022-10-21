import 'package:shopsie/presentation/product_page_screen/product_page_screen.dart';
import 'package:shopsie/presentation/product_page_screen/binding/product_page_binding.dart';
import 'package:shopsie/presentation/product_discover_screen/product_discover_screen.dart';
import 'package:shopsie/presentation/product_discover_screen/binding/product_discover_binding.dart';
import 'package:shopsie/presentation/splash_screen/splash_screen.dart';
import 'package:shopsie/presentation/splash_screen/binding/splash_binding.dart';
import 'package:shopsie/presentation/main_landing_screen/main_landing_screen.dart';
import 'package:shopsie/presentation/main_landing_screen/binding/main_landing_binding.dart';
import 'package:shopsie/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:shopsie/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String productPageScreen = '/product_page_screen';

  static String productDiscoverScreen = '/product_discover_screen';

  static String loginScreen = '/login_screen';

  static String cartScreen = '/cart_screen';

  static String splashScreen = '/splash_screen';

  static String registerScreen = '/register_screen';

  static String productSearchScreen = '/product_search_screen';

  static String mainLandingScreen = '/main_landing_screen';

  static String profileTabScreen = '/profile_tab_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: productPageScreen,
      page: () => ProductPageScreen(),
      bindings: [
        ProductPageBinding(),
      ],
    ),
    GetPage(
      name: productDiscoverScreen,
      page: () => ProductDiscoverScreen(),
      bindings: [
        ProductDiscoverBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: mainLandingScreen,
      page: () => MainLandingScreen(),
      bindings: [
        MainLandingBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
