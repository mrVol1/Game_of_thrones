import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_of_thrones/feature/domain/entites/person_entity.dart';
import 'package:game_of_thrones/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;
  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          person.fullName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24.0,
          ),
          Container(
            child: PersonCacheImage(
              wight: 260.0,
              height: 260.0,
              imageUrl: person.imageUrl,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ${person.firstName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                'Surname: ${person.lastName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            'Title: ${person.title}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            'House: ${person.family}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
