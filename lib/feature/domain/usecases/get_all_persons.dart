import 'package:dartz/dartz.dart';
import 'package:game_of_thrones/core/error/failure.dart';
import 'package:game_of_thrones/core/usecases/usecase.dart';
import 'package:game_of_thrones/feature/domain/entites/person_entity.dart';
import 'package:game_of_thrones/feature/domain/repositories/person_repository.dart';

class GetAllPersons extends UseCase<List<PersonEntity>> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  @override
  Future<Either<Failure, List<PersonEntity>>> call() async {
    return personRepository.getAllPersons();
  }
}
