import 'package:flutter/material.dart';
import '../models/models.dart';

class PilotsScreen extends StatefulWidget {
  const PilotsScreen({super.key});

  @override
  State<PilotsScreen> createState() => _PilotsScreenState();
}

class _PilotsScreenState extends State<PilotsScreen> {
  // Mock data for now
  final List<Pilot> _pilots = [
    Pilot(id: '1', name: 'John Doe', licenseNumber: 'P-12345'),
    Pilot(id: '2', name: 'Jane Smith', licenseNumber: 'P-67890'),
  ];

  void _addPilot() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final licenseController = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Pilot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: licenseController,
                decoration: const InputDecoration(labelText: 'License Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    _pilots.add(Pilot(
                      id: DateTime.now().toString(),
                      name: nameController.text,
                      licenseNumber: licenseController.text,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilots'),
      ),
      body: ListView.builder(
        itemCount: _pilots.length,
        itemBuilder: (context, index) {
          final pilot = _pilots[index];
          return ListTile(
            leading: CircleAvatar(child: Text(pilot.name[0])),
            title: Text(pilot.name),
            subtitle: Text('License: ${pilot.licenseNumber}'),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPilot,
        child: const Icon(Icons.add),
      ),
    );
  }
}
