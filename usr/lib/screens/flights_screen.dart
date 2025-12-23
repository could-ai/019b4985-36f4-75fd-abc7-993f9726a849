import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class FlightsScreen extends StatefulWidget {
  const FlightsScreen({super.key});

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  // Mock data
  final List<Flight> _flights = [
    Flight(
      id: '1',
      pilotId: '1',
      wingId: '1',
      date: DateTime.now().subtract(const Duration(days: 2)),
      durationMinutes: 45,
      location: 'Chamonix',
      notes: 'Smooth thermal flight',
    ),
  ];

  void _addFlight() {
    // In a real app, we'd select from existing pilots/wings
    showDialog(
      context: context,
      builder: (context) {
        final locationController = TextEditingController();
        final durationController = TextEditingController();
        final notesController = TextEditingController();
        
        return AlertDialog(
          title: const Text('Log New Flight'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(labelText: 'Duration (minutes)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (locationController.text.isNotEmpty) {
                  setState(() {
                    _flights.insert(0, Flight(
                      id: DateTime.now().toString(),
                      pilotId: '1', // Default for now
                      wingId: '1', // Default for now
                      date: DateTime.now(),
                      durationMinutes: int.tryParse(durationController.text) ?? 0,
                      location: locationController.text,
                      notes: notesController.text,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Log'),
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
        title: const Text('Flight Logs'),
      ),
      body: ListView.builder(
        itemCount: _flights.length,
        itemBuilder: (context, index) {
          final flight = _flights[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.flight, color: Colors.white),
              ),
              title: Text(flight.location),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('MMM d, yyyy - HH:mm').format(flight.date)),
                  Text('${flight.durationMinutes} mins'),
                  if (flight.notes != null && flight.notes!.isNotEmpty)
                    Text(
                      flight.notes!,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addFlight,
        label: const Text('Log Flight'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
