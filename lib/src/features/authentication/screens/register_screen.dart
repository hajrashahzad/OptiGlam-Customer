import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/authentication/controllers/register_screen_controller.dart';
import '../../../constants/constants.dart';
import 'login_screen.dart';
import '../../home/screens/home.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterScreenController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the outer Form with SingleChildScrollView
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: kBabyPink,
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: kBarbiePink,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(kBarbiePink),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(kWhite),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    padding:
                                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: kNormal,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(kWhite),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(kBarbiePink),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10),),
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: kNormal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Create an account!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: kBlack,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Happy to see you join!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: kGrey,
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: TextFormField(
                                controller: controller.fullName,
                                style: kSmallBlack,
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
                                controller: controller.email,
                                style: kSmallBlack,
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
                                controller: controller.phoneNumber,
                                style: kSmallBlack,
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
                                controller: controller.location,
                                style: kSmallBlack,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: TextFormField(
                                controller: controller.password,
                                style: kSmallBlack,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline, color: kGrey, size: 16,),
                                    hintText: 'Password',
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
                            const SizedBox(
                              height:25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width:  MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final user = UserModel(
                                        fullName: controller.fullName.text,
                                        email: controller.email.text.trim(),
                                        phone: controller.phoneNumber.text.trim(),
                                        location: controller.location.text,
                                        mstSkintone: 3,
                                        undertone: 'Warm'
                                      );
                                      final password = controller.password.text.trim();
                                      _formKey.currentState!.reset();
                                      RegisterScreenController.instance.registerUser(user, password);
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
          )
        ),
      ),
    );

  }
}
