class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phone;
  final String location;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.location,
  });

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "location": location,
    };
  }
}