import 'package:flutter/material.dart';
import '../models/models.dart';

class WingsScreen extends StatefulWidget {
  const WingsScreen({super.key});

  @override
  State<WingsScreen> createState() => _WingsScreenState();
}

class _WingsScreenState extends State<WingsScreen> {
  // Mock data
  final List<Wing> _wings = [
    Wing(id: '1', brand: 'Ozone', model: 'Delta 4', serialNumber: 'OZ-D4-001'),
    Wing(id: '2', brand: 'Advance', model: 'Sigma 11', serialNumber: 'AD-S11-555'),
  ];

  void _addWing() {
    showDialog(
      context: context,
      builder: (context) {
        final brandController = TextEditingController();
        final modelController = TextEditingController();
        final serialController = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Wing'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                controller: modelController,
                decoration: const InputDecoration(labelText: 'Model'),
              ),
              TextField(
                controller: serialController,
                decoration: const InputDecoration(labelText: 'Serial Number'),
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
                if (brandController.text.isNotEmpty) {
                  setState(() {
                    _wings.add(Wing(
                      id: DateTime.now().toString(),
                      brand: brandController.text,
                      model: modelController.text,
                      serialNumber: serialController.text,
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
        title: const Text('Wings'),
      ),
      body: ListView.builder(
        itemCount: _wings.length,
        itemBuilder: (context, index) {
          final wing = _wings[index];
          return ListTile(
            leading: const Icon(Icons.paragliding),
            title: Text('${wing.brand} ${wing.model}'),
            subtitle: Text('S/N: ${wing.serialNumber}'),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWing,
        child: const Icon(Icons.add),
      ),
    );
  }
}
