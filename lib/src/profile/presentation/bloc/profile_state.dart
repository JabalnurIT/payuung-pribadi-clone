part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileError extends ProfileState {
  const ProfileError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required this.user});

  final LocalUser user;

  @override
  List<Object> get props => [user];
}

final class ProfileUpdated extends ProfileState {
  const ProfileUpdated({required this.user});

  final LocalUser user;

  @override
  List<Object> get props => [user];
}

final class RegistrationImageUpdated extends ProfileState {
  const RegistrationImageUpdated({required this.user});

  final LocalUser user;

  @override
  List<Object> get props => [user];
}
