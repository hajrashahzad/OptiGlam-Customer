import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/controllers/cart_controller.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';
import 'package:optiglamcustomer/src/features/shop/screens/cart.dart';
import 'package:optiglamcustomer/src/features/try%20on/screens/filter_screen.dart';
import '../../../constants/constants.dart';
import '../controllers/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product}) {
    if (Get.isRegistered<ProductDetailsController>()) {
      Get.delete<ProductDetailsController>();
    }
    Get.put(ProductDetailsController());
  }

  final ProductModel product;
  final ProductDetailsController detailsController = Get.put(ProductDetailsController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    List<Widget> shadeList = [];
    for (var i = 0; i < product.shadeNames.length; i++) {
      shadeList.add(
        ShadeCircle(
          shadeName: product.shadeNames[i],
          shadeColor: Color(product.hexCodes[i]),
          shadeInt: product.hexCodes[i],
          detailsController: detailsController,
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
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: kWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.productName, style: kBoldBlackH1),
                        Text(product.brandName, style: kRegularBlackH2),
                        Text('${product.productPrice} PKR', style: kRegularGreyH2),
                        Text(product.productDescription, softWrap: true, style: kSmallBlack),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: shadeList),
                        ),
                        const Text('Selected Shade:', style: kSmall14Black),
                        Obx(() => Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Color(detailsController.selectedShade.value),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(detailsController.selectedShadeName.value, style: kSmall),
                              ),
                            )),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 20)),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kBabyPink,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            ),
                            child: const Text("Try it On", style: kSmall),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10)),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Obx(() => ElevatedButton(
                                onPressed: detailsController.selectedShadeName.value == 'None' ? null : () {
                                  cartController.addToCart(product, detailsController.selectedShadeName.value, detailsController.selectedShade.value);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kBarbiePink,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                ),
                                child: const Text("Add to Cart", style: kSmall),
                              )),
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
  final String shadeName;
  final Color shadeColor;
  final int shadeInt;
  final ProductDetailsController detailsController;

  ShadeCircle({
    super.key,
    required this.shadeName,
    required this.shadeColor,
    required this.shadeInt,
    required this.detailsController,
  });

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
                border: Border.all(color: kBabyPink, width: 2.0),
              ),
            ),
            const SizedBox(height: 1.5),
            Text(shadeName, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w100, color: kGrey)),
          ],
        ),
      ),
    );
  }
}
