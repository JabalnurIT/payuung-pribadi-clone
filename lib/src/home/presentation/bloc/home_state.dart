part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeError extends HomeState {
  const HomeError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class WellnessLoaded extends HomeState {
  const WellnessLoaded({required this.wellnesses});

  final List<Wellness> wellnesses;

  @override
  List<Object> get props => [wellnesses];
}
