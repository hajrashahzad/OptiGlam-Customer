import 'product_model.dart';

class CartElement{
  CartElement({required this.product, required this.selectedShadeName, required this.selectedShadeHex});
  ProductModel product;
  String selectedShadeName;
  int selectedShadeHex;
  int quantity = 1;
}