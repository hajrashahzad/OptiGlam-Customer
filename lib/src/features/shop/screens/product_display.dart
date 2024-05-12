import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
import 'product_details.dart';
import '../controllers/product_display_controller.dart';
import '../models/product_model.dart';

class ProductDisplay extends StatelessWidget {
  ProductDisplay({super.key, required this.category}) {
    if (Get.isRegistered<DisplayController>()) {
      Get.delete<DisplayController>();
    }
    Get.put(DisplayController());
  }
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
              child: Obx(() {
                if (displayController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (displayController.productList.isEmpty) {
                  return const Text("No products found.");
                } else {
                  return ListView.builder(
                    itemCount: displayController.productList.length,
                    itemBuilder: (context, index) => ProductDisplayButton(product: displayController.productList[index]),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDisplayButton extends StatelessWidget {
  final ProductModel product;
  
  ProductDisplayButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    final int maxChars = 15;
    String displayName = product.productName.length > maxChars
      ? '${product.productName.substring(0, maxChars)}...'
      : product.productName;

    String shadeName = product.productShade.length > maxChars
      ? 'Shade: ${product.productShade.substring(0, maxChars)}...'
      : 'Shade: ${product.productShade}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: kBabyPink,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset.fromDirection(-4),
                blurRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: kBackgroundGrey,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(product.imgURL), // Changed from AssetImage to NetworkImage
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      style: kRegularBarbiePinkH5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      shadeName,
                      style: kSmall14Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('${product.productPrice} PKR', style: kSmall14Black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
