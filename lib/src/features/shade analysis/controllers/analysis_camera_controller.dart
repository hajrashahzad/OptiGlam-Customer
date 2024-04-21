import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
class ImagePickerController extends GetxController {

  Future getImageFromCamera() async{
    List<Media>? res1 = await ImagesPicker.openCamera(pickType: PickType.image);
    List<Media>? res2 = await ImagesPicker.openCamera(pickType: PickType.image);
    List<Media>? res3 = await ImagesPicker.openCamera(pickType: PickType.image);

  }
  RxString imagePath = ''.obs;
  RxInt imgIndex = 0.obs;
  List<String> imgPaths = [];
  Future getImageFromGallery() async{
    List<Media>? res = await ImagesPicker.pick(pickType: PickType.image, count: 3);
  }
}