import 'package:game_of_thrones/core/platform/network_info.dart';
import 'package:game_of_thrones/feature/data/datasources/person_local_data_sources.dart';
import 'package:game_of_thrones/feature/data/datasources/person_remote_data_sources.dart';
import 'package:game_of_thrones/feature/data/repositories/person_repository_imp.dart';
import 'package:game_of_thrones/feature/domain/repositories/person_repository.dart';
import 'package:game_of_thrones/feature/domain/usecases/get_all_persons.dart';
import 'package:game_of_thrones/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serverLocator = GetIt.instance;

Future<void> init() async {
  // Cubit
  serverLocator.registerFactory(
    () => PersonListCubit(
      getAllPersons: serverLocator(),
    ),
  );

  //UseCases
  serverLocator.registerLazySingleton(
    () => GetAllPersons(
      serverLocator(),
    ),
  );

  //Repository
  serverLocator.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      networkInfo: serverLocator(),
      localDataSources: serverLocator(),
      remoteDataSources: serverLocator(),
    ),
  );

  serverLocator.registerLazySingleton<PersonRemoteDataSources>(
    () => PersonRemoteDataSourseImp(
      client: http.Client(),
    ),
  );

  serverLocator.registerLazySingleton<PersonLocalDataSources>(
    () => PersonLocalDataSourcesImp(
      sharedPreferences: serverLocator(),
    ),
  );

  //Core
  serverLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      serverLocator(),
    ),
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serverLocator.registerLazySingleton(
    () => sharedPreferences,
  );
  serverLocator.registerLazySingleton(
    () => http.Client(),
  );
  serverLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
