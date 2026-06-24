import 'package:flutter/foundation.dart';
import '../repository/person.dart';
import '../repository/person_repository.dart';

class PersonViewModel extends ChangeNotifier {
  final PersonRepository _repository;

  PersonViewModel(this._repository);

  Stream<List<Person>> get persons => _repository.watchAll();

  Future<void> addPerson(String name, int age) async {
    await _repository.addPerson(name, age);
  }
}
