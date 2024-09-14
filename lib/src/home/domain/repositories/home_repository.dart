import '../../../../core/utils/typedef.dart';
import '../entities/wellness.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<List<Wellness>> getAllWellness();
}
