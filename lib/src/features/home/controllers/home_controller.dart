import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get find => Get.find();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndex(int indexNum){
    currentPageIndex.value = indexNum;
  }

}