import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/screens/product_details.dart';
import '../../../constants/constants.dart';
import '../controllers/recommendation_controller.dart';
import '../../shop/controllers/product_details_controller.dart';
class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});
  final RecommendationController recommendationController =
      Get.put(RecommendationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
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
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: recommendationController.productList.length,
                itemBuilder: (context, index) =>
                    RecommendationCard(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  RecommendationCard({
    super.key,
    required this.index,
  });
  int index;
  RecommendationController recommendationController =
      Get.find<RecommendationController>();
  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          productDetailsController.setProduct(recommendationController.productList[index]);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
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
                      image: AssetImage(
                          recommendationController.productList[index].imgURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      recommendationController.productList[index].productName,
                      style: kRegularBarbiePinkH5,
                    ),
                    Text(
                      'Shade: ${recommendationController.productList[index].productShade}',
                      style: kSmall14Black,
                    ),
                    Text(
                      '${recommendationController.productList[index].productPrice} PKR',
                      style: kSmall14Black,
                    ),
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
