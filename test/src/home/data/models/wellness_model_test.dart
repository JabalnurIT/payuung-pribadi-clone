import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:payung_pribadi_clone/src/home/data/models/wellness_model.dart';
import 'package:payung_pribadi_clone/src/home/domain/entities/wellness.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  WellnessModel tWellnessModel = WellnessModel.empty();

  test('should be a subclass of [Wellness] entity',
      () => expect(tWellnessModel, isA<Wellness>()));

  final tMap = jsonDecode(fixture('wellness.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [WellnessModel] from the Map', () {
      final result = WellnessModel.fromMap(tMap);

      expect(result, equals(tWellnessModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('id');

      const call = WellnessModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tWellnessModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('fromEntity', () {
    test('should return a valid [WellnessModel] from the entity', () {
      final result = WellnessModel.fromEntity(tWellnessModel);

      expect(result, equals(tWellnessModel));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tWellnessModel.copyWith(
        title: 'title',
        stock: 100,
      );

      expect(
        result.title,
        equals('title'),
      );
      expect(
        result.stock,
        equals(100),
      );
    });
  });
}
