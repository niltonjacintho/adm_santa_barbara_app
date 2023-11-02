import 'package:flutter_test/flutter_test.dart';

import 'package:admFlutter/app/shared/util_service.dart';

void main() {
  UtilService service;

  setUp(() {
    service = UtilService();
  });
//
  group('UtilService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<UtilService>());
    });
  });
}
