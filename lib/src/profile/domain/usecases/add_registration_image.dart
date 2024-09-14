import 'package:image_picker/image_picker.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class AddRegistrationImage
    implements UsecaseWithParams<LocalUser, ImageSource> {
  const AddRegistrationImage(this._repository);

  final ProfileRepository _repository;

  @override
  ResultFuture<LocalUser> call(ImageSource imageSource) =>
      _repository.addRegistrationImage(
        imageSource: imageSource,
      );
}
