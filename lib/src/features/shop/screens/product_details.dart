import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/controllers/cart_controller.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';
import 'package:optiglamcustomer/src/features/shop/screens/cart.dart';
import 'package:optiglamcustomer/src/features/try%20on/screens/filter_screen.dart';
import '../../../constants/constants.dart';
import '../controllers/product_details_controller.dart';

///Product ID is being set when in the ProductDetailsController
///get Product details on the basis of the ID in the controller
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product}) {
    if (Get.isRegistered<ProductDetailsController>()) {
      Get.delete<ProductDetailsController>();
    }
    Get.put(ProductDetailsController());
  }
  ProductModel product;
  final ProductDetailsController detailsController = Get.put(ProductDetailsController());
  final CartController cartController = Get.put(CartController());
  List<Widget> shadeList = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < product.shadeNames.length; i++) {
      shadeList.add(
        ShadeCircle(
          shadeName: product.shadeNames[i],
          shadeColor: Color(product.hexCodes[i]),
          shadeInt: product.hexCodes[i],
        ),
      );
    }
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image(
                image: AssetImage(product.imgURL),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.27,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: kWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          product.productName,
                          style: kBoldBlackH1,
                        ),
                        Text(
                          product.brandName,
                          style: kRegularBlackH2,
                        ),
                        Text(
                          '${product.productPrice.toString()} PKR',
                          style: kRegularGreyH2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.productDescription,
                          softWrap: true,
                          style: kSmallBlack,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: shadeList,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Selected Shade: ',
                          style: kSmall14Black,
                        ),
                        Obx(
                          () => Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(detailsController.selectedShade.value),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                detailsController.selectedShadeName.value,
                                style: kSmall,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(8),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(kBabyPink),
                              ),
                              child: const Text(
                                "Try it On",
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
                            child: Obx(() =>  ElevatedButton(
                              onPressed: detailsController.selectedShadeName.value == 'None' ? null : () {
                                cartController.addToCart(product, detailsController.selectedShadeName.value, detailsController.selectedShade.value);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(8),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(kBarbiePink),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: kSmall,
                              ),
                            ),),
                          ),
                        ),
                      ],
                    ),
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

class ShadeCircle extends StatelessWidget {
  ShadeCircle({
    super.key,
    required this.shadeName,
    required this.shadeColor,
    required this.shadeInt,
  });
  final String shadeName;
  final Color shadeColor;
  final int shadeInt;
  final ProductDetailsController detailsController = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        detailsController.updateSelectedShade(shadeInt, shadeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        child: Column(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: shadeColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: kBabyPink,
                  width: 2.0,
                ),
              ),
            ),
            const SizedBox(
              height: 1.5,
            ),
            Text(
              shadeName,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w100,
                color: kGrey,
                inherit: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
