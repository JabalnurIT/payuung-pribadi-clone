part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  final dio = Dio();
  final api = API();
  final imagePicker = ImagePicker();
  final filePicker = FilePicker.platform;
  final databaseHelper = DatabaseHelperImpl.instance();

  await _initCore(
    prefs: prefs,
    dio: dio,
    api: api,
    imagePicker: imagePicker,
    filePicker: filePicker,
    databaseHelper: databaseHelper,
  );

  await _initProfile();
  await _initHome();
}

Future<void> _initCore({
  required SharedPreferences prefs,
  required Dio dio,
  required API api,
  required ImagePicker imagePicker,
  required FilePicker filePicker,
  required DatabaseHelper databaseHelper,
}) async {
  sl
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => api)
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => imagePicker)
    ..registerLazySingleton(() => filePicker)
    ..registerLazySingleton(() => databaseHelper);
}

Future<void> _initProfile() async {
  sl
    ..registerFactory(
      () => ProfileBloc(
        addRegistrationImage: sl(),
        getProfile: sl(),
        updateProfile: sl(),
      ),
    )
    ..registerLazySingleton(() => AddRegistrationImage(sl()))
    ..registerLazySingleton(() => GetProfile(sl()))
    ..registerLazySingleton(() => UpdateProfile(sl()))
    ..registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(sl()))
    ..registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl(
        imagePicker: sl(),
        databaseHelper: sl(),
      ),
    );
}

Future<void> _initHome() async {
  sl
    ..registerFactory(
      () => HomeBloc(
        getAllWellness: sl(),
      ),
    )
    ..registerLazySingleton(() => GetAllWellness(sl()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    ..registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(
        databaseHelper: sl(),
      ),
    );
}
