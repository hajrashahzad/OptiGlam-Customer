import 'package:get/get.dart';
import '../models/product_model.dart';
import 'package:optiglamcustomer/src/repository/products_repository/products_repository.dart';

class DisplayController extends GetxController{
  static DisplayController get find => Get.put(DisplayController());

  final _productRepo = Get.put(ProductRepository());

  List<ProductModel> productList = [];

  Future<List<ProductModel>> getProductsData(String category) async {
    List<ProductModel> products = await _productRepo.getAllProducts(category);
    productList = products;
    return products;
  }
}