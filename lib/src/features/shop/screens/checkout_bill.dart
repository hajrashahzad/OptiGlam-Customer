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
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                    const SizedBox(height: 20,),
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
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productName, style: kNormalBlack,),
              Text(price, style: kNormalBlack,),
            ],
          ),
        ),
        Divider(color: kGrey,),
      ],
    );
  }
}
