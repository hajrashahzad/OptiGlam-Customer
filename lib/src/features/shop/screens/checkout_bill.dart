import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class CheckoutBill extends StatelessWidget {
  const CheckoutBill({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: kBabyPink,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Your total bill',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: kBlack,
                          inherit: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Divider(color: kBarbiePink,),
                    SizedBox(height: 30,),
                    BillEntry(productName: 'Product Name', price: '2000 PKR',),
                    BillEntry(productName: 'Product Name', price: '899 PKR',),
                    BillEntry(productName: 'Product Name', price: '3599 PKR',),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

class BillEntry extends StatelessWidget {
  const BillEntry({
    super.key,
    required this.productName,
    required this.price,
  });
  final String productName;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productName, style: kNormalBlack,),
              Text(price, style: kNormalBlack,),
            ],
          ),
        ),
        const Divider(color: kGrey,),
      ],
    );
  }
}
