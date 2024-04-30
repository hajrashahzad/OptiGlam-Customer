import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/shop/screens/shop_main.dart';
import '../../../constants/constants.dart';
import 'checkout_details.dart';
import '../controllers/cart_controller.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBabyPink,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    Text(
                      'Opti',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 36,
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                          inherit: false),
                    ),
                    Text(
                      'Glam',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 36,
                          color: kBarbiePink,
                          fontWeight: FontWeight.bold,
                          inherit: false),
                    ),
                  ],
                ),
                const Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: kBlack,
                    fontWeight: FontWeight.w100,
                    inherit: false,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: cartController.itemCount.value,
                      itemBuilder: (context, index) => CartWidget(
                        productPrice: cartController
                            .cartList.value[index].product.productPrice,
                        productName: cartController
                            .cartList.value[index].product.productName,
                        quantity: cartController.cartList.value[index].quantity,
                        index: index,
                        imgURL: cartController.cartList.value[index].product.imgURL,
                        onPressed: () {
                          cartController.removeFromCart(index);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal',
                      style: kRegularBlackH3,
                    ),
                    Obx(() => Text(
                      '${cartController.subtotal.value}',
                      style: kRegularBlackH3,
                    ),),
                  ],
                ),
                const Divider(
                  color: kGrey,
                ),
                const Text(
                  'Shipping and Taxes calculated at checkout.',
                  style: kSmall14Grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Shop()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kBabyPink),
                      ),
                      child: const Text(
                        "Continue Shopping",
                        style: kSmall,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutDetails()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kBarbiePink),
                      ),
                      child: const Text(
                        "Check Out",
                        style: kSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  CartWidget({
    super.key,
    required this.productPrice,
    required this.productName,
    required this.imgURL,
    required this.quantity,
    required this.index,
    required this.onPressed,
  });
  final String productName;
  final double productPrice;
  final String imgURL;
  final int quantity;
  final int index;
  final void Function() onPressed;
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: kBackgroundGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: kGrey,
                image: DecorationImage(image: AssetImage(imgURL), fit: BoxFit.cover),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: kBoldBlackH5,
                          ),
                          Text(
                            '$productPrice PKR',
                            style: kSmallBlack14,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft,
                                  minimumSize: const Size(21, 30),
                                ),
                                onPressed: () {
                                  cartController.subtractProductCount(index);
                                },
                                child: Container(
                                  height: 21,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                    color: kBarbiePink,
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 1.0),
                                    child: Icon(
                                      Icons.minimize,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: kWhite,
                                height: 21,
                                width: 45,
                                child: Center(
                                    child: Text(
                                      '${cartController.quantities[index].value}',
                                      style: kSmallBlack14,
                                    )),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft,
                                  minimumSize: const Size(21, 30),
                                ),
                                onPressed: () {
                                  cartController.addProductCount(index);
                                },
                                child: Container(
                                  height: 21,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                    color: kBarbiePink,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(5),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),),
                        ],
                      ),
                      TextButton(
                        onPressed: onPressed,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(15, 15),
                        ),
                        child: const Icon(
                          Icons.delete_outline_outlined,
                          color: kBarbiePink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
