import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/add_registration_image.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AddRegistrationImage addRegistrationImage,
    required GetProfile getProfile,
    required UpdateProfile updateProfile,
  })  : _addRegistrationImage = addRegistrationImage,
        _getProfile = getProfile,
        _updateProfile = updateProfile,
        super(const ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      emit(const ProfileLoading());
    });
    on<AddRegistrationImageEvent>(_addRegistrationImageHandler);
    on<GetProfileEvent>(_getProfileHandler);
    on<UpdateProfileEvent>(_updateProfileHandler);
  }
  final AddRegistrationImage _addRegistrationImage;
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;

  Future<void> _addRegistrationImageHandler(
    AddRegistrationImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await _addRegistrationImage(event.imageSource);
    result.fold(
      (failure) => emit(ProfileError(message: failure.errorMessage)),
      (user) => emit(RegistrationImageUpdated(user: user)),
    );
  }

  Future<void> _getProfileHandler(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await _getProfile();
    result.fold(
      (failure) => emit(ProfileError(message: failure.errorMessage)),
      (user) => emit(ProfileLoaded(user: user)),
    );
  }

  Future<void> _updateProfileHandler(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await _updateProfile(event.user);
    result.fold(
      (failure) => emit(ProfileError(message: failure.errorMessage)),
      (user) => emit(ProfileUpdated(user: user)),
    );
  }
}
