import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
import '../../../common widgets/product_display_button.dart';
import 'product_details.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});
  @override
  Widget build(BuildContext context) {
    //TODO: write a function that converts your array of objects that you will get from your controller in an array of widgets
    String productId = '23345';
    return SafeArea(
        child: Container(
          color: kWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: SearchBar(
                    hintText: 'Search...',
                    hintStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: kGrey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(kBackgroundGrey),
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
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
                Container(
                  child: Column(
                    children: [
                      ProductDisplayButton(
                        productName: 'Product Name',
                        productDetails: 'Details',
                        productPrice: '2300 PKR',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productId: productId,)));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


