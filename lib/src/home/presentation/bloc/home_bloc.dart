import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/wellness.dart';
import '../../domain/usecases/get_all_wellness.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetAllWellness getAllWellness,
  })  : _getAllWellness = getAllWellness,
        super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {
      emit(const HomeLoading());
    });
    on<GetAllWellnessEvent>(_getAllWellnessHandler);
  }
  final GetAllWellness _getAllWellness;

  Future<void> _getAllWellnessHandler(
    GetAllWellnessEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getAllWellness();
    result.fold(
      (failure) => emit(HomeError(message: failure.errorMessage)),
      (wellnesses) => emit(WellnessLoaded(wellnesses: wellnesses)),
    );
  }
}
