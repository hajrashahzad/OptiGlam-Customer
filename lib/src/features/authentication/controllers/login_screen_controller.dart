import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';

class LoginScreenController extends GetxController{
  static LoginScreenController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());

  //TextField Controllers to get form data
  final email = TextEditingController();
  final password = TextEditingController();

  void signInUser(String email, String password) {
    this.email.clear();
    this.password.clear();
    _authRepo.loginUserWithEmailAndPassword(email, password);
  }

}