import 'package:flutter_test/flutter_test.dart';
import 'package:medusa_flutter/data/config.dart';

import 'package:medusa_flutter/medusa_flutter.dart';

void main() {
  test('create test', () {
    final medusa =
        Medusa(Config(baseUrl: "http://localhost:3000", apiKey: "apiKey"));
  });
}
