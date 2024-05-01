import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';
import '../models/cart_element_model.dart';
class CartController extends GetxController{
  static CartController get find => Get.find();
  RxList<CartElement> cartList = <CartElement>[].obs;
  List<RxInt> quantities = [];
  RxInt itemCount = 0.obs;
  RxDouble subtotal = 0.0.obs;
  int tempIndex = 0;
  bool isAlreadyInCart(ProductModel prod){
    for(var i =0; i < cartList.length; i++){
      if (prod.productId == cartList.value[i].product.productId){
        tempIndex = i;
        return true;
      }
      else {
        return false;
      }
    }
    return false; ///happens only in case cartList is empty
  }
  void addToCart(ProductModel product, String shadeName, int shadeHex){
    if (isAlreadyInCart(product) == false){
      cartList.value.add(CartElement(product: product, selectedShadeName: shadeName, selectedShadeHex: shadeHex));
      quantities.add(1.obs);
    }
    else{
      cartList.value[tempIndex].quantity = cartList.value[tempIndex].quantity + 1;
      quantities[tempIndex].value = quantities[tempIndex].value + 1;
    }
    itemCount.value = cartList.length;
    updateSubtotal(product.productPrice, true);
  }
  void removeFromCart(int index){
    updateSubtotal(cartList.value[index].product.productPrice, false);
    cartList.value.removeAt(index);
    quantities.removeAt(index);
    itemCount.value = cartList.length;

  }
  void subtractProductCount(int index){
    if(cartList.value[index].quantity == 1){
      cartList.value.removeAt(index);
      quantities.removeAt(index);
    }
    else if (cartList.value[index].quantity > 1){
      cartList.value[index].quantity = cartList.value[index].quantity - 1;
      quantities[index].value = quantities[index].value - 1;
    }
    itemCount.value = cartList.length;
    updateSubtotal(cartList.value[index].product.productPrice, false);
  }
  void addProductCount(int index){
    cartList.value[index].quantity = cartList.value[index].quantity + 1;
    quantities[index].value = quantities[index].value + 1;
    itemCount.value = cartList.length;
    updateSubtotal(cartList.value[index].product.productPrice, true);
  }
  void updateSubtotal(double x, bool add){
    if (add == true){
      subtotal.value = subtotal.value + x;
    }
    else {
      subtotal.value = subtotal.value - x;
    }
  }
}