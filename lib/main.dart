import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones/common/app_color.dart';
import 'package:game_of_thrones/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:game_of_thrones/feature/presentation/pages/person_screen.dart';
import 'package:game_of_thrones/locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonListCubit>(
      create: (context) => di.serverLocator<PersonListCubit>()..loadPerson(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: AppColors.mainBackground,
          scaffoldBackgroundColor: AppColors.mainBackground,
        ),
        home: const HomePage(),
      ),
    );
  }
}
