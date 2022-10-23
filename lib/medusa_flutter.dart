library medusa_flutter;

import 'package:dio/dio.dart';

import 'data/config.dart';
import "resources/auth.dart";
import "resources/carts.dart";
import "resources/collections.dart";
import "resources/customers.dart";
import "resources/gift_cards.dart";
import "resources/order_edits.dart";
import "resources/orders.dart";
import "resources/payment_methods.dart";
import "resources/products.dart";
import "resources/regions.dart";
import "resources/return_reasons.dart";
import "resources/returns.dart";
import "resources/shipping_options.dart";
import "resources/swaps.dart";

export '/data/config.dart';
export '/models/common/index.dart';
export '/models/req/index.dart';
export '/models/res/index.dart';
export '/models/store/index.dart';

class Medusa {
  final Dio _dio = Dio();

  late AuthResource auth;
  late CartsResource carts;
  late CustomersResource customers;
  late OrdersResource orders;
  late OrderEditsResource orderEdits;
  late ProductsResource products;
  late RegionsResource regions;
  late ReturnReasonsResource returnReasons;
  late ReturnsResource returns;
  late ShippingOptionsResource shippingOptions;
  late SwapsResource swaps;
  late CollectionsResource collections;
  late GiftCardsResource giftCards;
  late PaymentMethodsResource paymentMethods;

  Medusa(Config config) {
    _dio.options = BaseOptions(baseUrl: config.baseUrl, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    if (config.cookie != null) {
      _dio.options.headers["Cookie"] = config.cookie;
    }
    auth = AuthResource(_dio);
    carts = CartsResource(_dio);
    customers = CustomersResource(_dio);
    orders = OrdersResource(_dio);
    orderEdits = OrderEditsResource(_dio);
    products = ProductsResource(_dio);
    regions = RegionsResource(_dio);
    returnReasons = ReturnReasonsResource(_dio);
    returns = ReturnsResource(_dio);
    shippingOptions = ShippingOptionsResource(_dio);
    swaps = SwapsResource(_dio);
    collections = CollectionsResource(_dio);
    giftCards = GiftCardsResource(_dio);
    paymentMethods = PaymentMethodsResource(_dio);
  }
}