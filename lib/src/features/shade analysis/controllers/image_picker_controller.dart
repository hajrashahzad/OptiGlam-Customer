import 'dart:io';

import '../models/analysis_image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import 'package:optiglamcustomer/src/repository/user_repository/user_repository.dart';

class ImagePickerController extends GetxController {
  static ImagePickerController get find => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
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
  Future appendToImageList() async{
    ImagePicker p = ImagePicker();
    var picked = await p.pickMultiImage();
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

  Future<void> sendImagesToServer() async {
    // Step 1: Convert AnalysisImage to File and select up to 3 images
    List<File> selectedImages = await selectImagesFromList(imagesList);

    if (selectedImages.isEmpty) {
      print('No images selected');
      return;
    }

    // Step 2: Prepare the request payload
    List<String> base64Images = [];
    for (var image in selectedImages) {
      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      base64Images.add(base64Image);
    }

    Map<String, dynamic> payload = {'payload': base64Images};

    // Step 3: Send HTTP request to FastAPI server
    final url = Uri.parse('http://192.168.43.192:8000/get-MST');
    final response = await http.post(
      url,
      body: jsonEncode(payload),
      headers: {'Content-Type': 'application/json'},
    );

    // Step 4: Receive and print the response
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      final email = _authRepo.firebaseUser.value?.email;
      _userRepo.updateUserSkintone(email!, res['mst_skintone']);
    } else {
      print('Failed to send images. Status code: ${response.statusCode}');
    }
  }

  Future<List<File>> selectImagesFromList(RxList<AnalysisImage> imagesList) async {
    List<File> selectedImages = [];

    for (var image in imagesList) {
      if (selectedImages.length >= 3) {
        break; // Limit to 3 images
      }
      selectedImages.add(File(image.image.path)); // Assuming AnalysisImage has a 'path' property
    }

    return selectedImages;
  }
}