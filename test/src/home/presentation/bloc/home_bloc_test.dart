import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

import 'package:payung_pribadi_clone/core/errors/failure.dart';
import 'package:payung_pribadi_clone/src/home/domain/entities/wellness.dart';
import 'package:payung_pribadi_clone/src/home/domain/usecases/get_all_wellness.dart';
import 'package:payung_pribadi_clone/src/home/presentation/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllWellness extends Mock implements GetAllWellness {}

void main() {
  late MockGetAllWellness getAllWellness;
  late HomeBloc homeBloc;

  setUp(() {
    getAllWellness = MockGetAllWellness();
    homeBloc = HomeBloc(
      getAllWellness: getAllWellness,
    );
  });

  tearDown(() => homeBloc.close());

  test('InitialState must be [HomeInitial]', () {
    expect(homeBloc.state, const HomeInitial());
  });

  const tServerFailure = ServerFailure(
    message:
        'There is no user record corresponding to this identifier. The user may have been deleted.',
    statusCode: '404',
  );

  final tWellnesses =
      List.generate(12, (int index) => Wellness.empty(id: index.toString()));
  const tImageSource = ImageSource.camera;

  setUpAll(() {
    registerFallbackValue(tWellnesses);
    registerFallbackValue(tImageSource);
  });

  group('GetAllWellnessEvent', () {
    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, WellnessLoaded] when [GetAllWellnessEvent] is added",
      build: () {
        when(() => getAllWellness())
            .thenAnswer((_) async => Right(tWellnesses));
        return homeBloc;
      },
      act: (bloc) async {
        bloc.add(
          const GetAllWellnessEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        WellnessLoaded(wellnesses: tWellnesses),
      ],
      verify: (_) {
        verify(() => getAllWellness()).called(1);
        verifyNoMoreInteractions(getAllWellness);
      },
    );

    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, HomeError] when [GetAllWellnessEvent] fails",
      build: () {
        when(() => getAllWellness())
            .thenAnswer((_) async => const Left(tServerFailure));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetAllWellnessEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        HomeError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => getAllWellness()).called(1);
        verifyNoMoreInteractions(getAllWellness);
      },
    );
  });
}
