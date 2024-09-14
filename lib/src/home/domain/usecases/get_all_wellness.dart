import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/wellness.dart';
import '../repositories/home_repository.dart';

class GetAllWellness implements UsecaseWithoutParams<List<Wellness>> {
  const GetAllWellness(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<Wellness>> call() => _repository.getAllWellness();
}
