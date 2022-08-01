import 'package:dartz/dartz.dart';
import 'package:game_of_thrones/core/error/failure.dart';
import 'package:game_of_thrones/feature/domain/entites/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons();
}
