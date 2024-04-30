import 'package:get/get.dart';
import '../models/product_model.dart';

class DisplayController extends GetxController{
  static DisplayController get find => Get.put(DisplayController());
  List<ProductModel> productList = [
    ProductModel(productName: 'Name',
      productPrice: 5600,
      productShade: 'Fair - 01',
      productDescription:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      productId: '',
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'Brand Name',
      shadeNames: ['Name 1', 'Name 2', 'Name 3', 'Name 4', 'Name 5', 'Name 6', 'Name 7', 'Name 8', 'Name 9'],
      hexCodes: [0xFFFFDAAE, 0xFFE1A97A, 0xFFDFB38B, 0xFFCC9853, 0xFFCB814F, 0xFFBA936C, 0xFFAC8054, 0xFF9F5B34, 0xFF885A44],
    ),
    ///Just a dummy product for testing, remove when integrating backend
  ];
  void setProductList(String category){
    productList = []; //emptying list
    ///set the list, get the products from firebase and add them to the list.
    ///This function is being called every time the user accesses a category of shop
  }
}