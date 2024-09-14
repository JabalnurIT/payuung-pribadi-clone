import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class UpdateProfile implements UsecaseWithParams<LocalUser, LocalUser> {
  const UpdateProfile(this._repository);

  final ProfileRepository _repository;

  @override
  ResultFuture<LocalUser> call(LocalUser user) => _repository.updateProfile(
        user: user,
      );
}
