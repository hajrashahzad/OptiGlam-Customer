import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import 'package:optiglamcustomer/src/repository/user_repository/user_repository.dart';

class CommonController extends GetxController{
  static CommonController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    }
    else {
      Get.snackbar('Error', 'Could not fetch user details');
    }
  }

}