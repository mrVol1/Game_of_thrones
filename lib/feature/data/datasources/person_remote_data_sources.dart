import 'package:game_of_thrones/core/error/exception.dart';
import 'package:game_of_thrones/feature/data/models/person_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PersonRemoteDataSources {
  Future<List<PersonModel>> getAllPersons();
}
// call https://thronesapi.com/api/v2/Characters

class PersonRemoteDataSourseImp implements PersonRemoteDataSources {
  final http.Client client;

  PersonRemoteDataSourseImp({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons() async {
    // print(Url);
    final responce = await client.get(
      Uri.parse('https://thronesapi.com/api/v2/Characters'),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce.statusCode == 200) {
      final persons = json.decode(responce.body);
      return (persons as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
