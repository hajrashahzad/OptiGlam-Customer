import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/authentication/controllers/login_screen_controller.dart';
import '../../../constants/constants.dart';
import 'register_screen.dart';
import '../../home/screens/home.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
    bool isDarkMode() {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBabyPink,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/images/login.png'),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: kBarbiePink,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Login', style: kNormal,),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(kWhite),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(kBarbiePink),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10),),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                child: Text('Register', style: kNormal,),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(kBarbiePink),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: TextFormField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email_outlined, color: kGrey, size: 16,),
                                  hintText: 'Email',
                                  hintStyle: kSmall,
                                  filled: true,
                                  fillColor: kBackgroundGrey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: TextFormField(
                                controller: controller.password,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline, color: kGrey, size: 16,),
                                    hintText: 'Password',
                                    hintStyle: kSmall,
                                    filled: true,
                                    fillColor: kBackgroundGrey,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
                              child: TextButton(onPressed: (){}, child: Text('Forgot Password', style: TextStyle(fontFamily: 'Poppins'),),),
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
                                    if (_formKey.currentState!.validate()) {
                                      LoginScreenController.instance.signInUser(controller.email.text.trim(), controller.password.text.trim());
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
                                  child: const Text("Sign in"),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('OR', style: TextStyle(
                        color: kGrey,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        width:  MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(8),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                            foregroundColor: MaterialStateProperty.all<Color>(kGrey),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_to_drive),
                              Text("   Sign up with Google"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
