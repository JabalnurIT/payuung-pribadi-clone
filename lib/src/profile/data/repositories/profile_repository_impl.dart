import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../models/user_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._localDataSource);

  final ProfileLocalDataSource _localDataSource;

  @override
  ResultFuture<LocalUser> addRegistrationImage({
    required ImageSource imageSource,
  }) async {
    try {
      final result = await _localDataSource.addRegistrationImage(
        imageSource: imageSource,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<LocalUser> getProfile() async {
    try {
      final result = await _localDataSource.getProfile();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<LocalUser> updateProfile({required LocalUser user}) async {
    try {
      final result = await _localDataSource.updateProfile(
        user: LocalUserModel.fromEntity(user),
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
