import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:payung_pribadi_clone/src/profile/data/models/company_modal.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/company.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tCompanyModel = CompanyModel.empty();

  test('should be a subclass of [Company] entity',
      () => expect(tCompanyModel, isA<Company>()));

  final tMap = jsonDecode(fixture('company.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [CompanyModel] from the Map', () {
      final result = CompanyModel.fromMap(tMap);

      expect(result, equals(tCompanyModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('id');

      const call = CompanyModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tCompanyModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('fromEntity', () {
    test('should return a valid [CompanyModel] from the entity', () {
      final result = CompanyModel.fromEntity(tCompanyModel);

      expect(result, equals(tCompanyModel));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tCompanyModel.copyWith(
        name: 'name',
        address: 'address',
      );

      expect(
        result.name,
        equals('name'),
      );
      expect(
        result.address,
        equals('address'),
      );
    });
  });
}
