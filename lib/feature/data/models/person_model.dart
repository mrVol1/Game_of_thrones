import 'package:game_of_thrones/feature/domain/entites/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.family,
    required super.title,
    required super.imageUrl,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      family: json['family'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'image': family,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
