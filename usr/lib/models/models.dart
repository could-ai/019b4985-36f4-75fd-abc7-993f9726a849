class Pilot {
  final String id;
  final String name;
  final String licenseNumber;

  Pilot({required this.id, required this.name, required this.licenseNumber});
}

class Wing {
  final String id;
  final String brand;
  final String model;
  final String serialNumber;

  Wing({required this.id, required this.brand, required this.model, required this.serialNumber});
}

class Flight {
  final String id;
  final String pilotId;
  final String wingId;
  final DateTime date;
  final int durationMinutes;
  final String location;
  final String? notes;

  Flight({
    required this.id,
    required this.pilotId,
    required this.wingId,
    required this.date,
    required this.durationMinutes,
    required this.location,
    this.notes,
  });
}
