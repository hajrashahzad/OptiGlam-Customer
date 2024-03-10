import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';

class RegisterScreenController extends GetxController{
  static RegisterScreenController get instance => Get.find();

  //TextField Controllers to get form data
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final location = TextEditingController();
  final password = TextEditingController();
  final cnfrmPassword = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

}