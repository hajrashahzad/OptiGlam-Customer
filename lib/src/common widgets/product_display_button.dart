import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ProductDisplayButton extends StatelessWidget {
  const ProductDisplayButton({
    super.key,
    required this.productName,
    required this.productDetails,
    required this.productPrice,
    required this.onTap,
  });
  final String productName;
  final String productPrice;
  final String productDetails;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
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
              decoration: const BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.zero)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: kNormalBlack,),
                  Text(productPrice, style: kSmall14Grey,),
                  Text(productDetails, style: kSmall14Grey,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
