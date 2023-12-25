import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/constants/constants.dart';
import 'src/features/welcome/screens/splash_screen.dart';
import 'src/features/welcome/screens/landing_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const OptiGlamCustomer());
}

class OptiGlamCustomer extends StatelessWidget {
  const OptiGlamCustomer({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kWhite,
        primaryColor: kBabyPink,
        highlightColor: kBabyPink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kBlack),
            foregroundColor: MaterialStateProperty.all<Color>(kWhite),
            shadowColor: MaterialStateProperty.all<Color>(kShadowColor),
          )
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
          bodyLarge: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kBlack,
        primaryColor: kBabyPink,
        highlightColor: kBabyPink,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kBarbiePink),
              foregroundColor: MaterialStateProperty.all<Color>(kWhite),
              shadowColor: MaterialStateProperty.all<Color>(kShadowColor),
            ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          bodyLarge: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: LandingPage(),
    );
  }
}


