import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/shop/screens/cart.dart';
import '../../../constants/constants.dart';
import 'cart.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final String productId; //Get product information using the product id
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image(
                image: AssetImage('assets/images/foundation-sample.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.27,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: kWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Product Name',
                        style: kBoldBlackH1,
                      ),
                      Text(
                        'Brand Name',
                        style: kRegularBlackH2,
                      ),
                      Text(
                        '3499 PKR',
                        style: kRegularGreyH2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Description - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                        softWrap: true,
                        style: kSmallBlack,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ), //TODO: write function to convert array of shade objects into ShadeCircle objects
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                            ShadeCircle(
                              shadeName: 'sand dunes',
                              shadeColor: kBackgroundGrey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Product Reviews',
                        style: kRegularBlackH3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: kBackgroundGrey,
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage(
                                        'assets/images/user_profile.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w200,
                                          color: kBlack,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        'Review smod e et dol....',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w100,
                                            color: kBlack,
                                            fontSize: 11),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Icon(Icons.chevron_right, color: kBarbiePink,),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(8),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(kBabyPink),
                            ),
                            child: const Text("Try it On", style: kSmall,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(8),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(kBarbiePink),
                            ),
                            child: const Text("Add to Cart", style: kSmall,),
                          ),
                        ),
                      ),
                    ],
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
  const ShadeCircle({
    super.key,
    required this.shadeName,
    required this.shadeColor,
  });
  final String shadeName;
  final Color shadeColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      child: Column(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: shadeColor, //TODO: Get list of all foundation hexcodes from the database
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w100,
              color: kGrey,
              inherit: false,
            ),
          )
        ],
      ),
    );
  }
}
