import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import 'package:optiglamcustomer/src/repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class RegisterScreenController extends GetxController{
  static RegisterScreenController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  //TextField Controllers to get form data
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final location = TextEditingController();
  final password = TextEditingController();

  void registerUser(UserModel user, String password) {
    fullName.clear();
    email.clear();
    phoneNumber.clear();
    location.clear();
    this.password.clear();
    _authRepo.createUserWithEmailAndPassword(user.email, password);
    _userRepo.createUser(user);
  }

}