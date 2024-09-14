import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/user.dart';
import 'package:payung_pribadi_clone/src/profile/domain/repositories/profile_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/get_profile.dart';

import 'profile_repository.mock.dart';

void main() {
  late ProfileRepository repository;
  late GetProfile usecase;

  setUp(() {
    repository = MockProfileRepo();
    usecase = GetProfile(repository);
  });

  final tUser = LocalUser.empty();

  setUpAll(() {
    registerFallbackValue(tUser);
  });

  test(
    'should call the [ProfileRepo.GetProfile]',
    () async {
      when(
        () => repository.getProfile(),
      ).thenAnswer(
        (_) async => Right(tUser),
      );

      final result = await usecase();

      expect(result, equals(Right<dynamic, LocalUser>(tUser)));

      verify(() => repository.getProfile()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
