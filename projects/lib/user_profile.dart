class UserProfile {
  String name;
  String phone;
  int age;
  String healthIssues;
  String disability;

  UserProfile({
    required this.name,
    required this.phone,
    required this.age,
    required this.healthIssues,
    required this.disability,
  });

  // Method to check if the profile data is complete
  bool isComplete() {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        age > 0 &&
        healthIssues.isNotEmpty &&
        disability.isNotEmpty;
  }

  // Method to convert an instance to JSON for storage or transmission
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'age': age,
      'healthIssues': healthIssues,
      'disability': disability,
    };
  }

  // Factory constructor to create an instance from JSON data
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      phone: json['phone'],
      age: json['age'],
      healthIssues: json['healthIssues'],
      disability: json['disability'],
    );
  }
}
