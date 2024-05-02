import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<ProductModel> getProductDetails(int id) async {
    final snapshot = await _db.collection("Products").where("id", isEqualTo: id).get();
    final productData = snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).single;
    return productData;
  }

  Future<List<ProductModel>> getAllProducts(String category) async {
    final snapshot = await _db.collection("Products").where('category', isEqualTo: category).get();
    print(ProductModel.fromSnapshot(snapshot.docs[0]));
    print(ProductModel.fromSnapshot(snapshot.docs[1]));
    print(ProductModel.fromSnapshot(snapshot.docs[2]));
    final productData = snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    return productData;
  }
}