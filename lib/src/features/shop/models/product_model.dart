class ProductModel {
  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productShade,
    required this.productId,
    required this.imgURL,
    required this.brandName,
    required this.shadeNames,
    required this.hexCodes,
  });
  String productId;
  String productName;
  double productPrice;
  String productShade;
  String productDescription;
  String imgURL;
  String brandName;
  List<String> shadeNames = [];
  List<int> hexCodes = [];
}
