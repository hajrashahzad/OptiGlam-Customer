import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final String mstSkintone;
  final String undertone;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.location,
    required this.mstSkintone,
    required this.undertone
  });

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "location": location,
      "mstSkintone": mstSkintone,
      "undertone": undertone,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      id: document.id,
      email: data?['email'],
      phone: data?['phone'],
      location: data?['location'],
      fullName: data?['fullName'],
      mstSkintone: data?['mstSkintone'],
      undertone: data?['undertone']
    );
  }
}