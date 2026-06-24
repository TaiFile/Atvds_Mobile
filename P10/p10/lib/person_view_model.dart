import 'package:flutter/foundation.dart';
import 'person.dart';
import 'person_dao.dart';

class PersonViewModel extends ChangeNotifier {
  final PersonDao _dao;

  PersonViewModel(this._dao);

  Stream<List<Person>> get persons => _dao.watchAll();

  Future<void> addPerson(String name, int age) async {
    await _dao.insertPerson(Person(name: name, age: age));
  }
}
