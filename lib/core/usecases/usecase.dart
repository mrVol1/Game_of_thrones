import 'package:dartz/dartz.dart';
import 'package:game_of_thrones/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
