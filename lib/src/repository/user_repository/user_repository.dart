import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
      () => Get.snackbar('Success', 'Your account has been created',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green)
    ).catchError((error, stackTrace) {
      Get.snackbar('Error', 'Your account could not be created',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserSkintone(String email, String skintone) async {
    final snapshot = await _db.collection("Users").where("email", isEqualTo: email).get();
    DocumentReference<Map<String, dynamic>> userRef = snapshot.docs.first.reference;
    await userRef.update({'mstSkintone': skintone});    
    return;
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}