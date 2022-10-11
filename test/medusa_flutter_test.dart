import 'package:flutter_test/flutter_test.dart';
import 'package:medusa_flutter/data/config.dart';

import 'package:medusa_flutter/medusa_flutter.dart';

Future<void> main() async {
  test('create test', () async {
    final medusa = Medusa(Config(baseUrl: "http://localhost:9000"));
  });
}
