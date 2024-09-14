import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:payung_pribadi_clone/src/profile/data/models/financial_model.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/financial.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tFinancialModel = FinancialModel.empty();

  test('should be a subclass of [Financial] entity',
      () => expect(tFinancialModel, isA<Financial>()));

  final tMap = jsonDecode(fixture('financial.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [FinancialModel] from the Map', () {
      final result = FinancialModel.fromMap(tMap);

      expect(result, equals(tFinancialModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('id');

      const call = FinancialModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tFinancialModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('fromEntity', () {
    test('should return a valid [FinancialModel] from the entity', () {
      final result = FinancialModel.fromEntity(tFinancialModel);

      expect(result, equals(tFinancialModel));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tFinancialModel.copyWith(
        bankName: 'bankName',
        bankBranch: 'bankBranch',
      );

      expect(
        result.bankName,
        equals('bankName'),
      );
      expect(
        result.bankBranch,
        equals('bankBranch'),
      );
    });
  });
}
