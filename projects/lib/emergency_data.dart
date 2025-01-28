class EmergencyData {
  String type; // Type of emergency
  int people; // Number of people in danger
  String? needs; // Specific needs (optional)
  String? injuries; // Information on injuries (optional)
  String location; // GPS coordinates or descriptive location
  String contact; // Phone number for follow-up
  DateTime timestamp; // Date and time of the message

  // Constructor to initialize all fields
  EmergencyData({
    required this.type,
    required this.people,
    this.needs, // Optional
    this.injuries, // Optional
    required this.location,
    required this.contact,
    required this.timestamp,
  });

  // Method to convert an instance to JSON for sending via SMS or API
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'people': people,
      'needs': needs ?? '', // Default to empty string if null
      'injuries': injuries ?? '', // Default to empty string if null
      'location': location,
      'contact': contact,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Factory constructor to create an instance from JSON data
  factory EmergencyData.fromJson(Map<String, dynamic> json) {
    return EmergencyData(
      type: json['type'],
      people: json['people'],
      needs: json['needs'],
      injuries: json['injuries'],
      location: json['location'],
      contact: json['contact'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}