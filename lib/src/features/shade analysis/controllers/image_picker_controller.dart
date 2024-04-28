import 'dart:io';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

import '../models/analysis_image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
class ImagePickerController extends GetxController {
  static ImagePickerController get find => Get.find();
  RxList<AnalysisImage> imagesList = <AnalysisImage>[].obs;
  List<RxBool> lightingConditionList = []; ///just for maintaining state
  RxInt itemCount = 0.obs;
  RxBool isListEmpty = true.obs;
  RxBool isLengthGreaterThan3 = false.obs;
  Future getImageFromGallery() async{
    imagesList.value = [];
    lightingConditionList = [];
    ImagePicker picker = ImagePicker();  //removed final var
    var pickedFiles = await picker.pickMultiImage(); //removed final var
    if (pickedFiles != null){
      for(var i=0; i<pickedFiles.length;i++){
        AnalysisImage temp = AnalysisImage();
        temp.setImage(File(pickedFiles[i].path));
        temp.setImgPath(pickedFiles[i].path);
        imagesList.value.add(temp);
        lightingConditionList.add(true.obs); //adding RxBool value to this list
      }
      itemCount.value = imagesList.value.length;
      updateListFlag();
      updateLengthFlag();
    }
  }
  Future appendToImageList() async{
    ImagePicker p = ImagePicker();
    var picked = await p.pickMultiImage();
    if (picked != null){
      for(var i=0; i<picked.length;i++){
        AnalysisImage temp = AnalysisImage();
        temp.setImage(File(picked[i].path));
        temp.setImgPath(picked[i].path);
        imagesList.value.add(temp);
        lightingConditionList.add(true.obs);
      }
      itemCount.value = imagesList.value.length;
      updateListFlag();
      updateLengthFlag();
    }
  }
  void removeImage(int index){
    imagesList.value.removeAt(index);
    itemCount.value = imagesList.value.length;
    lightingConditionList.removeAt(index);
    updateListFlag();
    updateLengthFlag();
  }
  void updateListFlag(){
    if (itemCount.value == 0) {
      isListEmpty.value = true;
    }
    else{
      isListEmpty.value = false;
    }
  }
  void updateLengthFlag(){
    if (itemCount.value >= 3) {
      isLengthGreaterThan3.value = true;
    }
    else{
      isLengthGreaterThan3.value  = false;
    }
  }
  void updateLightingConditionAtIndex(bool condition,int index){
    imagesList.value[index].setLightingFlag(condition);
    imagesList.value[index].setLightingCondition();
    lightingConditionList[index].value = condition;
  }
}