import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payung_pribadi_clone/core/errors/exceptions.dart';
import 'package:payung_pribadi_clone/core/services/database_helper.dart';
import 'package:payung_pribadi_clone/src/profile/data/datasources/profile_local_data_source.dart';
import 'package:payung_pribadi_clone/src/profile/data/models/user_model.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePicker extends Mock implements ImagePicker {}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  late ImagePicker imagePicker;
  late ProfileLocalDataSourceImpl dataSource;
  late DatabaseHelper databaseHelper;
  LocalUserModel tLocalUser = LocalUserModel.empty();

  setUp(() async {
    imagePicker = MockImagePicker();
    databaseHelper = MockDatabaseHelper();
    dataSource = ProfileLocalDataSourceImpl(
      imagePicker: imagePicker,
      databaseHelper: databaseHelper,
    );
  });

  final XFile tFile = XFile('assets/images/item_example.png');
  const tImage = 'image';
  const tSource = ImageSource.camera;

  setUpAll(() {
    registerFallbackValue(tLocalUser);
    registerFallbackValue(tFile);
    registerFallbackValue(tImage);
    registerFallbackValue(tSource);
  });

  group(
    'addRegistrationImage',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => imagePicker.pickImage(
            source: any(named: 'source'),
            imageQuality: any(named: 'imageQuality'),
            maxWidth: any(named: 'maxWidth'),
          ),
        ).thenAnswer((_) async => tFile);

        final call = dataSource.addRegistrationImage;
        expect(
          () => call(imageSource: tSource),
          returnsNormally,
        );

        verify(
          () => imagePicker.pickImage(
            source: ImageSource.camera,
            imageQuality: 100,
            maxWidth: 1024,
          ),
        ).called(1);
        verifyNoMoreInteractions(imagePicker);
      });

      test(
        'should throw [ServerException] when [ImagePicker] returns null',
        () async {
          when(
            () => imagePicker.pickImage(
              source: any(named: 'source'),
              imageQuality: any(named: 'imageQuality'),
              maxWidth: any(named: 'maxWidth'),
            ),
          ).thenAnswer((_) async => null);

          final call = dataSource.addRegistrationImage;
          expect(
            () => call(imageSource: tSource),
            throwsA(isA<ServerException>()),
          );

          verify(
            () => imagePicker.pickImage(
              source: ImageSource.camera,
              imageQuality: 100,
              maxWidth: 1024,
            ),
          ).called(1);
          verifyNoMoreInteractions(imagePicker);
        },
      );
    },
  );

  group(
    'getProfile',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => databaseHelper.checkTable(
            table: any(named: 'table'),
          ),
        ).thenAnswer((_) async => true);

        when(
          () => databaseHelper.get(
            table: any(named: 'table'),
            id: any(named: 'id'),
          ),
        ).thenAnswer((_) async => tLocalUser.toMap());

        when(
          () => databaseHelper.close(),
        ).thenAnswer((_) async => Future.value());

        final call = dataSource.getProfile;

        expect(
          () => call(),
          returnsNormally,
        );

        verify(
          () => databaseHelper.checkTable(
            table: any(named: 'table'),
          ),
        ).called(1);

        verifyNoMoreInteractions(databaseHelper);
      });
    },
  );

  group(
    'updateProfile',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => databaseHelper.checkTable(
            table: any(named: 'table'),
          ),
        ).thenAnswer((_) async => true);

        when(
          () => databaseHelper.update(
            table: any(named: 'table'),
            data: any(named: 'data'),
          ),
        ).thenAnswer((_) async => tLocalUser.toMap());

        when(
          () => databaseHelper.close(),
        ).thenAnswer((_) async => Future.value());

        final call = dataSource.updateProfile;

        expect(
          () => call(user: tLocalUser),
          returnsNormally,
        );

        verify(
          () => databaseHelper.checkTable(
            table: any(named: 'table'),
          ),
        ).called(1);

        verifyNoMoreInteractions(databaseHelper);
      });
    },
  );
}
