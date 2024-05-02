import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
import 'product_details.dart';
import '../controllers/product_display_controller.dart';
import '../models/product_model.dart';

class ProductDisplay extends StatelessWidget {
  ProductDisplay({super.key, required this.category});
  String category;
  DisplayController displayController = Get.put(DisplayController());
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
              child: FutureBuilder(
                future: displayController.getProductsData(category),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.done) {
                  //   if (snapshot.hasData) {
                      List<ProductModel> productsData = snapshot.data as List<ProductModel>;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: productsData.length,
                        itemBuilder: (context, index) => ProductDisplayButton(
                          product: productsData[index],
                        ),
                      );
                  //   }
                  //   else {
                  //     return const CircularProgressIndicator();
                  //   }
                  // }
                  // else {
                  //   return const CircularProgressIndicator();
                  // }
                }
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
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product)));
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
                    '${product.productPrice.toString()} PKR',
                    style: kSmall14Grey,
                  ),
                  // Text(
                  //   product.productShade,
                  //   style: kSmall14Grey,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
