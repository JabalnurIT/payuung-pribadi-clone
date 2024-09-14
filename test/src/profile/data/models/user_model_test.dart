import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:payung_pribadi_clone/src/profile/data/models/user_model.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  LocalUserModel tLocalUserModel = LocalUserModel.empty();

  test('should be a subclass of [LocalUser] entity',
      () => expect(tLocalUserModel, isA<LocalUser>()));

  final tMap = jsonDecode(fixture('user.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [LocalUserModel] from the Map', () {
      final result = LocalUserModel.fromMap(tMap);

      expect(result, equals(tLocalUserModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('id');

      const call = LocalUserModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tLocalUserModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('fromEntity', () {
    test('should return a valid [LocalUserModel] from the entity', () {
      final result = LocalUserModel.fromEntity(tLocalUserModel);

      expect(result, equals(tLocalUserModel));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tLocalUserModel.copyWith(
        name: 'name',
        email: 'email',
      );

      expect(
        result.name,
        equals('name'),
      );
      expect(
        result.email,
        equals('email'),
      );
    });
  });
}
