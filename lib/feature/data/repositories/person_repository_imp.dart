import 'package:game_of_thrones/core/error/exception.dart';
import 'package:game_of_thrones/core/platform/network_info.dart';
import 'package:game_of_thrones/feature/data/datasources/person_local_data_sources.dart';
import 'package:game_of_thrones/feature/data/datasources/person_remote_data_sources.dart';
import 'package:game_of_thrones/feature/domain/entites/person_entity.dart';
import 'package:game_of_thrones/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:game_of_thrones/feature/domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSources remoteDataSources;
  final PersonLocalDataSources localDataSources;
  final NetworkInfo networkInfo;
  PersonRepositoryImpl(
      {required this.remoteDataSources,
      required this.localDataSources,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSources.getAllPersons();
        localDataSources.personsToCashe(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSources.getLastPersonsFromCasge();
        return Right(locationPerson);
      } on CasheException {
        return Left(CasgeFailure());
      }
    }
  }
}
