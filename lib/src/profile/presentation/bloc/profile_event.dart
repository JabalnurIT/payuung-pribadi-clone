part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class AddRegistrationImageEvent extends ProfileEvent {
  const AddRegistrationImageEvent({
    required this.imageSource,
  });

  final ImageSource imageSource;

  @override
  List<Object> get props => [imageSource];
}

class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();
}

class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent({
    required this.user,
  });

  final LocalUser user;

  @override
  List<Object> get props => [user];
}
