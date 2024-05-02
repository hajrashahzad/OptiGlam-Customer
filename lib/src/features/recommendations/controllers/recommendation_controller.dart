import 'package:get/get.dart';
import '../../shop/models/product_model.dart';

///Go to recommendation_screen.dart and change AssetImage to NetworkImage in RecommendationCard once connected to firebase

class RecommendationController extends GetxController {
  static RecommendationController get find => Get.find();
  List<ProductModel> productList = [
    ProductModel(
      id: 1,
      productName: 'dummy Name',
      productPrice: 3,
      productDescription:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'random brand',
      shadeNames: ['Name 1', 'Name 2', 'Name 3', 'Name 4', 'Name 5', 'Name 6', 'Name 7', 'Name 8', 'Name 9'],
      productShade: 'Name 1',
      hexCodes: [0xFFFFDAAE, 0xFFE1A97A, 0xFFDFB38B, 0xFFCC9853, 0xFFCB814F, 0xFFBA936C, 0xFFAC8054, 0xFF9F5B34, 0xFF885A44],
      category: 'Face'
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
