import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'login_screen.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
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
                Text('Create an\naccount!', style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: kBlack,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
