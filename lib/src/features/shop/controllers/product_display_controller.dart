import 'package:get/get.dart';
import '../models/product_model.dart';
import 'package:optiglamcustomer/src/repository/products_repository/products_repository.dart';

class DisplayController extends GetxController{
  static DisplayController get find => Get.put(DisplayController());

  final _productRepo = Get.put(ProductRepository());

  int decimalToHex(int decimal) {
  // Convert the decimal to a hex string using toRadixString(16)
  return int.parse(decimal.toRadixString(16), radix: 16);
}

  List<ProductModel> productList = [
    ProductModel(
      productName: 'Sheer Glow Foundation',
      productPrice: 5000,
      productDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      id: 1,
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'NARS',
      shadeNames: ['Barcelona-M4'],
      hexCodes: [0xFF9F5B34],
      productShade: 'Barcelona-M4', 
      category: 'Face'
    ),
    ProductModel(
      productName: 'HYDRA FOUNDATION',
      productPrice: 4500,
      productDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      id: 1,
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'SmashBox',
      shadeNames: ['2.15'],
      hexCodes: [0xFFCB814F],
      productShade: '2.15', 
      category: 'Face'
    ),
    ProductModel(
      productName: 'Longwear Makeup',
      productPrice: 3000,
      productDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      id: 2,
      imgURL: 'assets/images/foundation-sample.jpg',
      brandName: 'Revlon',
      shadeNames: ['True Beige-320'],
      hexCodes: [0xFFFFDAAE],
      productShade: 'True Beige-320', 
      category: 'Face'
    )
  ];

  Future<List<ProductModel>> getProductsData(String category) async {
    List<ProductModel> products = await _productRepo.getAllProducts(category);
    productList = products;
    return productList;
  }
  List<ProductModel> getList(){
    return productList;
  }
}