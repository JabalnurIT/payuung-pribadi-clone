import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../src/home/data/datasources/home_local_data_source.dart';
import '../../src/home/data/repositories/home_repository_impl.dart';
import '../../src/home/domain/repositories/home_repository.dart';
import '../../src/home/domain/usecases/get_all_wellness.dart';
import '../../src/home/presentation/bloc/home_bloc.dart';
import '../../src/profile/data/datasources/profile_local_data_source.dart';
import '../../src/profile/data/repositories/profile_repository_impl.dart';
import '../../src/profile/domain/repositories/profile_repository.dart';
import '../../src/profile/domain/usecases/add_registration_image.dart';
import '../../src/profile/domain/usecases/get_profile.dart';
import '../../src/profile/domain/usecases/update_profile.dart';
import '../../src/profile/presentation/bloc/profile_bloc.dart';
import '../services/api.dart';

part 'injection_container.main.dart';
