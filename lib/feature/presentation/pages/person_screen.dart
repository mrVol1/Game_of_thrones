import 'package:flutter/material.dart';
import 'package:game_of_thrones/feature/presentation/widgets/persons_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Of Thrones'),
        centerTitle: true,
      ),
      body: PersonsList(),
    );
  }
}
