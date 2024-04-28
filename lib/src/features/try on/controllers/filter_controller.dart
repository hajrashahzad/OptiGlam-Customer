import 'package:get/get.dart';

class FilterController extends GetxController{
  RxString filterPath = 'assets/effects/filteragain.deepar'.obs;

  void changeFilter(String p){
    filterPath.value = p;
  }
}