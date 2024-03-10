import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';

class LoginScreenController extends GetxController{
  static LoginScreenController get instance => Get.find();

  //TextField Controllers to get form data
  final email = TextEditingController();
  final password = TextEditingController();

  void signInUser(String email, String password) {
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

}