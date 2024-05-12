import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/authentication/screens/login_screen.dart';
import 'package:optiglamcustomer/src/features/home/screens/home.dart';
import 'package:optiglamcustomer/src/features/welcome/screens/landing_page.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/exceptions/authentication_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginScreen()) : Get.offAll(() => Home());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => Home()) : Get.to(() => const LandingPage());
    } on FirebaseAuthException catch(e) {
      final ex = AuthenticationFailure.code(e.code);
      print('Firebase Auth Error: ${ex.message}');
      Get.snackbar('Error', ex.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      throw ex;
    } catch(_) {
      const ex = AuthenticationFailure();
      print('Firebase Auth Error: ${ex.message}');
      Get.snackbar('Error', ex.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      throw ex;
    }
    
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      final ex = AuthenticationFailure.code(e.code);
      print('Firebase Auth Error: ${ex.message}');
      Get.snackbar('Error', ex.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      throw ex;
    } catch(_) {
      const ex = AuthenticationFailure();
      print('Firebase Auth Error: ${ex.message}');
      Get.snackbar('Error', ex.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      throw ex;
    }
    
  }

  Future<void> logout() async => await _auth.signOut();
}