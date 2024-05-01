import 'package:get/get.dart';
import '../../shop/models/product_model.dart';

///Go to recommendation_screen.dart and change AssetImage to NetworkImage in RecommendationCard once connected to firebase

class RecommendationController extends GetxController {
  static RecommendationController get find => Get.find();
  List<ProductModel> productList = [
    ProductModel(
      productName: 'Name',
      productPrice: 5600,
      productShade: 'Fair - 01',
      productDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      productId: '',
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'Brand Name',
      shadeNames: ['Name 1', 'Name 2', 'Name 3', 'Name 4', 'Name 5', 'Name 6', 'Name 7', 'Name 8', 'Name 9'],
      hexCodes: [0xFFFFDAAE, 0xFFE1A97A, 0xFFDFB38B, 0xFFCC9853, 0xFFCB814F, 0xFFBA936C, 0xFFAC8054, 0xFF9F5B34, 0xFF885A44],
    ), ///Just a dummy product for testing, remove when integrating backend
  ];
  void initializeList() {
    ///initialize it from firebase like this -> productList.add(Product(productName, productPrice, productShade, productDescription));
  }
  @override
  void onInit() {
    super.onInit();
    initializeList();
  }
}
