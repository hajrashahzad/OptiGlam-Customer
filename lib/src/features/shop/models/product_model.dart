import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.id,
    required this.imgURL,
    required this.brandName,
    required this.shadeNames,
    required this.hexCodes,
    required this.productShade,
    required this.category,
  });
  int id;
  String productName;
  double productPrice;
  String productDescription;
  String imgURL;
  String brandName;
  String productShade;
  String category;
  List<String> shadeNames;
  List<int> hexCodes = [];

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProductModel(
      id: data?['id'],
      productName: data?['productName'],
      productPrice: data?['productPrice'],
      productDescription: data?['productDescription'],
      imgURL: data?['imgURL'],
      brandName: data?['brandName'],
      shadeNames: data?['shadeNames'],
      hexCodes: data?['hexCodes'],
      productShade: data?['shadeNames'][0],
      category: data?['category'],
    );
  }
}
