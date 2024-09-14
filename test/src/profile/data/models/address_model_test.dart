import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:payung_pribadi_clone/src/profile/data/models/address_model.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/address.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tAddressModel = AddressModel.empty();

  test('should be a subclass of [Address] entity',
      () => expect(tAddressModel, isA<Address>()));

  final tMap = jsonDecode(fixture('address.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [AddressModel] from the Map', () {
      final result = AddressModel.fromMap(tMap);

      expect(result, equals(tAddressModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('id');

      const call = AddressModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tAddressModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('fromEntity', () {
    test('should return a valid [AddressModel] from the entity', () {
      final result = AddressModel.fromEntity(tAddressModel);

      expect(result, equals(tAddressModel));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tAddressModel.copyWith(
        street: 'street',
        province: 'province',
      );

      expect(
        result.street,
        equals('street'),
      );
      expect(
        result.province,
        equals('province'),
      );
    });
  });
}
