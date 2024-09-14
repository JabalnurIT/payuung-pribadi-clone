import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class GetProfile implements UsecaseWithoutParams<LocalUser> {
  const GetProfile(this._repository);

  final ProfileRepository _repository;

  @override
  ResultFuture<LocalUser> call() => _repository.getProfile();
}
