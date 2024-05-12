import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../controllers/cart_controller.dart';
import '../../shop/models/product_model.dart';  // Make sure this path is correct

class CheckoutBill extends StatelessWidget {
  const CheckoutBill({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();  // Get the controller instance

    return SafeArea(
      child: Container(
        color: kBabyPink,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Obx(() => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Your total bill',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: kBlack,
                        inherit: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(color: kBarbiePink),
                  SizedBox(height: 30),
                  ...List.generate(cartController.cartList.length, (index) {
                    final ProductModel item = cartController.cartList.value[index].product;
                    return BillEntry(
                      productName: item.productName, 
                      price: '${item.productPrice} PKR',
                    );
                  }),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class BillEntry extends StatelessWidget {
  const BillEntry({
    super.key,
    required this.productName,
    required this.price,
  });
  final String productName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productName, style: kNormalBlack),
              Text(price, style: kNormalBlack),
            ],
          ),
        ),
        const Divider(color: kGrey),
      ],
    );
  }
}
