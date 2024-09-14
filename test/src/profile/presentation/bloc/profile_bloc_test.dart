import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

import 'package:payung_pribadi_clone/core/errors/failure.dart';
import 'package:payung_pribadi_clone/src/profile/domain/entities/user.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/add_registration_image.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/get_profile.dart';
import 'package:payung_pribadi_clone/src/profile/domain/usecases/update_profile.dart';
import 'package:payung_pribadi_clone/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAddRegistrationImage extends Mock implements AddRegistrationImage {}

class MockGetProfile extends Mock implements GetProfile {}

class MockUpdateProfile extends Mock implements UpdateProfile {}

void main() {
  late MockAddRegistrationImage addRegistrationImage;
  late MockGetProfile getProfile;
  late MockUpdateProfile updateProfile;
  late ProfileBloc profileBloc;

  setUp(() {
    addRegistrationImage = MockAddRegistrationImage();
    getProfile = MockGetProfile();
    updateProfile = MockUpdateProfile();
    profileBloc = ProfileBloc(
      addRegistrationImage: addRegistrationImage,
      getProfile: getProfile,
      updateProfile: updateProfile,
    );
  });

  tearDown(() => profileBloc.close());

  test('InitialState must be [ProfileInitial]', () {
    expect(profileBloc.state, const ProfileInitial());
  });

  const tServerFailure = ServerFailure(
    message:
        'There is no user record corresponding to this identifier. The user may have been deleted.',
    statusCode: '404',
  );

  final tUser = LocalUser.empty();
  const tImageSource = ImageSource.camera;

  setUpAll(() {
    registerFallbackValue(tUser);
    registerFallbackValue(tImageSource);
  });

  group('AddRegistrationImageEvent', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, RegistrationImageUpdated] when [AddRegistrationImageEvent] is added",
      build: () {
        when(() => addRegistrationImage(any()))
            .thenAnswer((_) async => Right(tUser));
        return profileBloc;
      },
      act: (bloc) async {
        bloc.add(
          const AddRegistrationImageEvent(
            imageSource: tImageSource,
          ),
        );
      },
      expect: () => [
        const ProfileLoading(),
        RegistrationImageUpdated(user: tUser),
      ],
      verify: (_) {
        verify(() => addRegistrationImage(any())).called(1);
        verifyNoMoreInteractions(addRegistrationImage);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, ProfileError] when [AddRegistrationImageEvent] fails",
      build: () {
        when(() => addRegistrationImage(any()))
            .thenAnswer((_) async => const Left(tServerFailure));
        return profileBloc;
      },
      act: (bloc) {
        bloc.add(
          const AddRegistrationImageEvent(
            imageSource: tImageSource,
          ),
        );
      },
      expect: () => [
        const ProfileLoading(),
        ProfileError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => addRegistrationImage(any())).called(1);
        verifyNoMoreInteractions(addRegistrationImage);
      },
    );
  });

  // delete group
  group('GetProfileEvent', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, ProfileLoaded] when [GetProfileEvent] is added",
      build: () {
        when(() => getProfile()).thenAnswer((_) async => Right(tUser));
        return profileBloc;
      },
      act: (bloc) async {
        bloc.add(
          const GetProfileEvent(),
        );
      },
      expect: () => [
        const ProfileLoading(),
        ProfileLoaded(user: tUser),
      ],
      verify: (_) {
        verify(() => getProfile()).called(1);
        verifyNoMoreInteractions(getProfile);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, ProfileError] when [GetProfileEvent] fails",
      build: () {
        when(() => getProfile())
            .thenAnswer((_) async => const Left(tServerFailure));
        return profileBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetProfileEvent(),
        );
      },
      expect: () => [
        const ProfileLoading(),
        ProfileError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => getProfile()).called(1);
        verifyNoMoreInteractions(getProfile);
      },
    );
  });

  group('UpdateProfileEvent', () {
    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, ProfileUpdated] when [UpdateProfileEvent] is added",
      build: () {
        when(() => updateProfile(tUser)).thenAnswer((_) async => Right(tUser));
        return profileBloc;
      },
      act: (bloc) async {
        bloc.add(
          UpdateProfileEvent(user: tUser),
        );
      },
      expect: () => [
        const ProfileLoading(),
        ProfileUpdated(user: tUser),
      ],
      verify: (_) {
        verify(() => updateProfile(tUser)).called(1);
        verifyNoMoreInteractions(updateProfile);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      "should emit [ProfileLoading, ProfileError] when [UpdateProfileEvent] fails",
      build: () {
        when(() => updateProfile(tUser))
            .thenAnswer((_) async => const Left(tServerFailure));
        return profileBloc;
      },
      act: (bloc) {
        bloc.add(
          UpdateProfileEvent(user: tUser),
        );
      },
      expect: () => [
        const ProfileLoading(),
        ProfileError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => updateProfile(tUser)).called(1);
        verifyNoMoreInteractions(updateProfile);
      },
    );
  });
}
