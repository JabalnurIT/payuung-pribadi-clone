import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/src/home/domain/entities/wellness.dart';
import 'package:payung_pribadi_clone/src/home/domain/repositories/home_repository.dart';
import 'package:payung_pribadi_clone/src/home/domain/usecases/get_all_wellness.dart';
import 'package:mocktail/mocktail.dart';

import 'home_repository.mock.dart';

void main() {
  late HomeRepository repository;
  late GetAllWellness usecase;

  setUp(() {
    repository = MockHomeRepo();
    usecase = GetAllWellness(repository);
  });

  final tWellnesses = List.generate(
    6,
    (index) => Wellness.empty(id: index.toString()),
  );

  setUpAll(() {
    registerFallbackValue(tWellnesses);
  });

  test(
    'should call the [HomeRepo.GetAllWellness]',
    () async {
      when(
        () => repository.getAllWellness(),
      ).thenAnswer(
        (_) async => Right(tWellnesses),
      );

      final result = await usecase();

      expect(result, equals(Right<dynamic, List<Wellness>>(tWellnesses)));

      verify(() => repository.getAllWellness()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
