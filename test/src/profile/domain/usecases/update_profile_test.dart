import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/user.dart';
import 'package:payung_pribadi_clone/src/profile/domain/repositories/profile_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/update_profile.dart';

import 'profile_repository.mock.dart';

void main() {
  late ProfileRepository repository;
  late UpdateProfile usecase;

  setUp(() {
    repository = MockProfileRepo();
    usecase = UpdateProfile(repository);
  });

  final tUser = LocalUser.empty();

  setUpAll(() {
    registerFallbackValue(tUser);
  });

  test(
    'should call the [ProfileRepo.UpdateProfile]',
    () async {
      when(
        () => repository.updateProfile(
          user: any(named: 'user'),
        ),
      ).thenAnswer(
        (_) async => Right(tUser),
      );

      final result = await usecase(tUser);

      expect(result, equals(Right<dynamic, LocalUser>(tUser)));

      verify(() => repository.updateProfile(
            user: any(named: 'user'),
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
