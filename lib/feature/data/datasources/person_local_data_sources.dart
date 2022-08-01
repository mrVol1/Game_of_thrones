import 'package:game_of_thrones/core/error/exception.dart';
import 'package:game_of_thrones/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class PersonLocalDataSources {
  Future<List<PersonModel>> getLastPersonsFromCasge();
  Future<void> personsToCashe(List<PersonModel> persons);
}

class PersonLocalDataSourcesImp implements PersonLocalDataSources {
  final SharedPreferences sharedPreferences;
  PersonLocalDataSourcesImp({required this.sharedPreferences});
  @override
  Future<List<PersonModel>> getLastPersonsFromCasge() {
    final jsonPersonsList =
        sharedPreferences.getStringList('CACHED_PERSONS_LIST');
    if (jsonPersonsList!.isNotEmpty) {
      return Future.value(jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CasheException();
    }
  }

  @override
  Future<void> personsToCashe(List<PersonModel> persons) {
    final List<String> jsonPersonsList =
        persons.map((person) => json.encode(person.toJson())).toList();

    sharedPreferences.setStringList('CACHED_PERSONS_LIST', jsonPersonsList);
    print('Persons: ${jsonPersonsList.length}');
    return Future.value(jsonPersonsList);
  }
}
