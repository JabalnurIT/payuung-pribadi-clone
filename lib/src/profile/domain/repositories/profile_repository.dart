import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  ResultFuture<LocalUser> addRegistrationImage({
    required ImageSource imageSource,
  });

  ResultFuture<LocalUser> getProfile();

  ResultFuture<LocalUser> updateProfile({
    required LocalUser user,
  });
}
