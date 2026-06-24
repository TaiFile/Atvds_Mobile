import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/floor/app_database.dart';
import 'repository/person_repository.dart';
import 'viewmodel/person_view_model.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final repository = PersonRepository(database.personDao);
  final viewModel = PersonViewModel(repository);

  runApp(
    ChangeNotifierProvider.value(
      value: viewModel,
      child: const MyApp(),
    ),
  );
}
