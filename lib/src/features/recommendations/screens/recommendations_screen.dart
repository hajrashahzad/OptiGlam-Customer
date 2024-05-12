import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/shop/models/product_model.dart';
import 'package:optiglamcustomer/src/features/shop/screens/product_details.dart';
import '../../../constants/constants.dart';
import '../controllers/recommendation_controller.dart';
import '../../shop/controllers/product_details_controller.dart';
class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});
  final RecommendationController recommendationController = Get.put(RecommendationController());
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
            FutureBuilder(
              future: recommendationController.getRecommendations(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<ProductModel> products = recommendationController.productList;
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: products.length,
                      itemBuilder: (context, index) =>
                        RecommendationCard(index: index),
                    ),
                  );
                }
                else {
                  return const CircularProgressIndicator();
                }
              }
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
  @override
  Widget build(BuildContext context) {
    final RecommendationController recommendationController = Get.put(RecommendationController());
    final ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
    return FutureBuilder(
      future: recommendationController.getRecommendations(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ProductModel product = recommendationController.productList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                productDetailsController.setProduct(product);
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
                            image: AssetImage(
                                product.imgURL),
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
                            product.productName,
                            style: kRegularBarbiePinkH5,
                          ),
                          Text(
                            'Shade: ${product.productShade}',
                            style: kSmall14Black,
                          ),
                          Text(
                            '${product.productPrice} PKR',
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
        else {
          return const CircularProgressIndicator();  
        }
      }
    );
  }
}
