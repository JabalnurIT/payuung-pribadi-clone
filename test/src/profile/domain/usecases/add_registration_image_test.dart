import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/user.dart';
import 'package:payung_pribadi_clone/src/profile/domain/repositories/profile_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/add_registration_image.dart';

import 'profile_repository.mock.dart';

void main() {
  late ProfileRepository repository;
  late AddRegistrationImage usecase;

  setUp(() {
    repository = MockProfileRepo();
    usecase = AddRegistrationImage(repository);
  });

  const tImage = 'image';
  const tSource = ImageSource.camera;
  final tUser = LocalUser.empty(id: "0");

  setUpAll(() {
    registerFallbackValue(tImage);
    registerFallbackValue(tSource);
    registerFallbackValue(tUser);
  });

  test(
    'should call the [ProfileRepo.AddRegistrationImage]',
    () async {
      when(
        () => repository.addRegistrationImage(
          imageSource: any(named: 'imageSource'),
        ),
      ).thenAnswer(
        (_) async => Right(tUser),
      );

      final result = await usecase(tSource);

      expect(result, equals(Right<dynamic, LocalUser>(tUser)));

      verify(() => repository.addRegistrationImage(
            imageSource: any(named: 'imageSource'),
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
