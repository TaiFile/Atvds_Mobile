import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/person.dart';
import '../viewmodel/person_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _addPerson() {
    final vm = context.read<PersonViewModel>();
    final name = _nameController.text.trim();
    final age = int.tryParse(_ageController.text.trim());

    if (name.isEmpty || age == null) return;

    vm.addPerson(name, age);
    _nameController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PersonViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Idade'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _addPerson,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Person>>(
              stream: vm.persons,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final people = snapshot.data!;

                if (people.isEmpty) {
                  return const Center(child: Text('Nenhuma pessoa cadastrada.'));
                }

                return ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, i) {
                    final person = people[i];
                    return ListTile(
                      title: Text(person.name),
                      subtitle: Text('${person.age} anos'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
