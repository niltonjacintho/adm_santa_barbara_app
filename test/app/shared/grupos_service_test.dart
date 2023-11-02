import 'package:flutter_test/flutter_test.dart';

import 'package:admFlutter/app/shared/grupos_service.dart';

void main() {
  GruposService service;

  setUp(() {
    service = GruposService();
  });
//
  group('GruposService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<GruposService>());
    });
//
  });
}
