import 'person.dart';
import 'floor/person_dao.dart';

class PersonRepository {
  final PersonDao _dao;

  PersonRepository(this._dao);

  Stream<List<Person>> watchAll() => _dao.watchAll();

  Future<void> addPerson(String name, int age) async {
    await _dao.insertPerson(Person(name: name, age: age));
  }
}
