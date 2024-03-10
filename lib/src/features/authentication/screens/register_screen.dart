import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'login_screen.dart';
import '../../home/screens/home.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kBabyPink,
            padding: const EdgeInsets.all(10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                              child: Text(
                                'Login',
                                style: kNormal,
                              ),
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
                                  EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: kNormal,
                              ),
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
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10),),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Create an\naccount!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: kBlack,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 10),
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
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outlined, color: kGrey, size: 16,),
                                hintText: 'Full Name',
                                hintStyle: kSmall,
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
                                hintStyle: kSmall,
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
                                hintStyle: kSmall,
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
                                hintStyle: kSmall,
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
                                prefixIcon: const Icon(Icons.lock_outline, color: kGrey, size: 16,),
                                hintText: 'Password',
                                hintStyle: kSmall,
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
                                prefixIcon: const Icon(Icons.lock_open, color: kGrey, size: 16,),
                                hintText: 'Confirm Password',
                                hintStyle: kSmall,
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('OR', style: TextStyle(
                            color: kGrey,
                          ),),
                        ),
                      ],
                    ),
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
        ),
      ),
    );
  }
}
