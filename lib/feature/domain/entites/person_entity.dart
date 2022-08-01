import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String imageUrl;

  const PersonEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.family,
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        fullName,
        family,
        title,
        imageUrl,
      ];
}
