import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import 'checkout_bill.dart';
import '../controllers/cart_controller.dart'; // Ensure you import the CartController correctly

class CheckoutDetails extends StatelessWidget {
  const CheckoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

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
                    const Text(
                      'Confirm your details!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: kBlack,
                      ),
                    ),
                    const Text(
                      'Come back again!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: kGrey,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Obx(() => Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildTextFormField(
                            context: context,
                            initialValue: cartController.user.value?.fullName ?? '',
                            hintText: 'Full Name',
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 12,), // Spacing between fields
                          buildTextFormField(
                            context: context,
                            initialValue: cartController.user.value?.email ?? '',
                            hintText: 'Email',
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 12,), // Spacing between fields
                          buildTextFormField(
                            context: context,
                            initialValue: cartController.user.value?.phone ?? '',
                            hintText: 'Phone Number',
                            icon: Icons.phone_outlined,
                          ),
                          const SizedBox(height: 12,), // Spacing between fields
                          buildTextFormField(
                            context: context,
                            initialValue: cartController.user.value?.location ?? '', // Assuming there is a location field in UserModel
                            hintText: 'Location',
                            icon: Icons.pin_drop_outlined,
                          ),
                          const SizedBox(height: 25,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutBill()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(kBlack),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: const Text("Next", style: TextStyle(color: kWhite)),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required BuildContext context,
    required String initialValue,
    required String hintText,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(fontSize: 12, color: kBlack, fontFamily: 'Poppins',),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: kGrey, size: 16),
        hintText: hintText,
        hintStyle: kSmallBlack,
        filled: true,
        fillColor: kBackgroundGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
