import 'package:get/get.dart';
import '../models/product_model.dart';
class ProductDetailsController extends GetxController{
  static ProductDetailsController get find => Get.find();
  ProductModel product = ProductModel(
    productName: 'dummy Name',
    productPrice: 3,
    productShade: 'dummy val',
    productDescription:
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    productId: '',
    imgURL: 'assets/images/foundation-sample.jpg',
    brandName: 'random brand',
    shadeNames: ['Name 1', 'Name 2', 'Name 3', 'Name 4', 'Name 5', 'Name 6', 'Name 7', 'Name 8', 'Name 9'],
    hexCodes: [0xFFFFDAAE, 0xFFE1A97A, 0xFFDFB38B, 0xFFCC9853, 0xFFCB814F, 0xFFBA936C, 0xFFAC8054, 0xFF9F5B34, 0xFF885A44],
  );
  RxInt selectedShade = 0xFFF3F3F3.obs;
  RxString selectedShadeName = 'None'.obs;
  void setProduct(ProductModel p){
    product = p;
  }
  void updateSelectedShade(int shade, String name){
    selectedShade.value = shade;
    selectedShadeName.value = name;
  }
}