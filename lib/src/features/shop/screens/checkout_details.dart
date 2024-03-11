import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'checkout_bill.dart';
class CheckoutDetails extends StatelessWidget {
  const CheckoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kBabyPink,
            padding: const EdgeInsets.all(10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Confirm your\n details!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: kBlack,
                          inherit: false,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Come back again!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: kGrey,
                          inherit: false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,8,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outlined, color: kGrey, size: 16,),
                                  hintText: 'Full Name',
                                  hintStyle: kSmallBlack,
                                  filled: true,
                                  fillColor: kBackgroundGrey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,8,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email_outlined, color: kGrey, size: 16,),
                                  hintText: 'Email',
                                  hintStyle: kSmallBlack,
                                  filled: true,
                                  fillColor: kBackgroundGrey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,8,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.phone_outlined, color: kGrey, size: 16,),
                                  hintText: 'Phone Number',
                                  hintStyle: kSmallBlack,
                                  filled: true,
                                  fillColor: kBackgroundGrey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,8,0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.pin_drop_outlined, color: kGrey, size: 16,),
                                  hintText: 'Location',
                                  hintStyle: kSmallBlack,
                                  filled: true,
                                  fillColor: kBackgroundGrey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height:25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              width:  MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutBill()));
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(8),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(kBlack),
                                ),
                                child: const Text("Next"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
