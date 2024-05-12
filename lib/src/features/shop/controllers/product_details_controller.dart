import 'package:get/get.dart';
import '../models/product_model.dart';
class ProductDetailsController extends GetxController{
  static ProductDetailsController get find => Get.find();

  RxInt selectedShade = 0xFFF3F3F3.obs;
  RxString selectedShadeName = 'None'.obs;

  void updateSelectedShade(int shade, String name){
    selectedShade.value = shade;
    selectedShadeName.value = name;
  }
}