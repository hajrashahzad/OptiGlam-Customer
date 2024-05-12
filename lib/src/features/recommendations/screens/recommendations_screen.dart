import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';
import 'package:optiglamcustomer/src/features/shop/screens/product_details.dart';
import '../../../constants/constants.dart';
import '../controllers/recommendation_controller.dart';

class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key}) {
    if (Get.isRegistered<RecommendationController>()) {
      Get.delete<RecommendationController>();
    }
    Get.put(RecommendationController());
  }
  final RecommendationController recommendationController = Get.put(RecommendationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            const Text(
              'Foundation Recommendations',
              style: kBoldBarbiePinkH1,
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'A few product recommendations based on the images that you submitted for skin tone analysis!',
                style: kSmall14Grey,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Obx(() {
                if (recommendationController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (recommendationController.productList.isEmpty) {
                  return const Text("No products found.");
                } else {
                  return ListView.builder(
                    itemCount: recommendationController.productList.length,
                    itemBuilder: (context, index) => RecommendationCard(product: recommendationController.productList[index]),
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

class RecommendationCard extends StatelessWidget {
  final ProductModel product;

  RecommendationCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    final int maxChars = 15;
    String displayName = product.productName.length > maxChars
      ? '${product.productName.substring(0, maxChars)}...'
      : product.productName;

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
                    Text('Shade: ${product.productShade}', style: kSmall14Black),
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
