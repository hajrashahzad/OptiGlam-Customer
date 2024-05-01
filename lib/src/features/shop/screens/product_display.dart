import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/controllers/product_details_controller.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
import 'product_details.dart';
import '../controllers/product_display_controller.dart';
import '../models/product_model.dart';

class ProductDisplay extends StatelessWidget {
  ProductDisplay({super.key});
  final DisplayController displayController = Get.put(DisplayController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: SearchBar(
                hintText: 'Search...',
                hintStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: kGrey,
                    fontFamily: 'Poppins',
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kBackgroundGrey),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0),
                  child: Icon(
                    Icons.search_outlined,
                    color: kGrey,
                    size: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: displayController.productList.length,
                itemBuilder: (context, index) => ProductDisplayButton(
                  product: displayController.productList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDisplayButton extends StatelessWidget {
  ProductDisplayButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  final ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        productDetailsController.setProduct(product);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: kBackgroundGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.zero),
                  image: DecorationImage(
                    image: AssetImage(product.imgURL),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: kNormalBlack,
                  ),
                  Text(
                    '${product.productPrice} PKR',
                    style: kSmall14Grey,
                  ),
                  Text(
                    product.productShade,
                    style: kSmall14Grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
