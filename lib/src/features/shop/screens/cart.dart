import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'checkout_details.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return SafeArea(
      child: Container(
        color: kBabyPink,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Opti',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 36,
                            color: kBlack,
                            fontWeight: FontWeight.bold, inherit: false),
                      ),
                      Text(
                        'Glam',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 36,
                            color: kBarbiePink,
                            fontWeight: FontWeight.bold, inherit: false),
                      ),
                    ],
                  ),
                  const Text(
                    'Shopping Cart',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: kBlack,
                        fontWeight: FontWeight.w100, inherit: false,),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CartWidget(productName: 'Product Name', productPrice: 'Price in PKR', quantity: '1',),
                        CartWidget(productName: 'Product Name', productPrice: 'Price in PKR', quantity: '1',),
                        CartWidget(productName: 'Product Name', productPrice: 'Price in PKR', quantity: '1',),
                        CartWidget(productName: 'Product Name', productPrice: 'Price in PKR', quantity: '1',),
                        CartWidget(productName: 'Product Name', productPrice: 'Price in PKR', quantity: '1',),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal', style: kRegularBlackH3,),
                      Text('5889', style: kRegularBlackH3,)
                    ],
                  ),
                  Divider(color: kGrey,),
                  Text('Shipping and Taxes calculated at checkout.', style: kSmallGrey,),
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
                        child: const Text("Continue Shopping", style: kSmall,),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutDetails()));
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
                        child: const Text("Check Out", style: kSmall,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.productPrice,
    required this.productName,
    required this.quantity,
  });
  final String productName;
  final String productPrice;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: kBackgroundGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: kGrey, //TODO: insert product thumbnail here
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: kBoldBlackH5,
                          ),
                          Text(
                            productPrice,
                            style: kSmallBlack14,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.all(0), tapTargetSize: MaterialTapTargetSize.shrinkWrap, alignment: Alignment.centerLeft,minimumSize: Size(21, 30),),
                                onPressed: () {},
                                child: Container(
                                  height: 21,
                                  width: 29,
                                  decoration: BoxDecoration(
                                    color: kBarbiePink,
                                    borderRadius: BorderRadius.horizontal(left: Radius.circular(5),),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    child: Icon(Icons.minimize, color: kWhite,),
                                  ),
                                ),
                              ),
                              Container(
                                color: kWhite,
                                height: 21,
                                width: 45,
                                child: Center(child: Text(quantity, style: kSmallBlack14,)),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.all(0), tapTargetSize: MaterialTapTargetSize.shrinkWrap, alignment: Alignment.centerLeft,minimumSize: Size(21, 30),),
                                onPressed: () {},
                                child: Container(
                                  height: 21,
                                  width: 29,
                                  decoration: BoxDecoration(
                                    color: kBarbiePink,
                                    borderRadius: BorderRadius.horizontal(right: Radius.circular(5),),
                                  ),
                                  child: Center(child: Icon(Icons.add, color: kWhite,),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(onPressed: (){}, child: Icon(Icons.close, color: kBlack,), style: TextButton.styleFrom(padding: EdgeInsets.all(0), tapTargetSize: MaterialTapTargetSize.shrinkWrap, alignment: Alignment.centerLeft,minimumSize: Size(15, 15),),),
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
